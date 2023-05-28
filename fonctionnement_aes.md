

# AES en Haskell

Dans ce document est présenté le fonctionnement des fonctions d'aes.





## Fonctionnement de AES


AES est une méthode de cryptage de données par blocks, c'est a dire que l'information a coder est decoupée en morceaux de taille fixe. Dans AES, ils sont de taille 16 octets. Il y a trois principales versions d'AES, AES-128, AES-192 et AES-256. La principale différence est la taille de la clé.
Pour AES-128, nous avons :
```
Length cipher key = 128
Length text = 128
```
```
Nb = 4 car 4*32bit (si un word = 32 bit) (taille des block (nb word))
Nr = 10 (nombre de tours)
Nk = 4 (key length)
```

### Codage :

Pour la version 128, il y a 10 tours de codage :

            --> 1x init
            --> 9x tour classique
            --> 1x tour final

Voici le pseudo code du codage pour AES 128 :

```Cipher(clé_de_chiffrement, block (128 bits))
    keySchedule = keyExpension(clé_de_chiffrement)
    AddRoundKey() // See Sec. 5.1.4
    Pour tours = 1 à nombre_de_tours-1
        SubBytes() // See Sec. 5.1.1
        ShiftRows() // See Sec. 5.1.2
        MixColumns() // See Sec. 5.1.3
        AddRoundKey()
    SubBytes()
    ShiftRows()
    AddRoundKey()
```


### AddRoundKey(block, clé_de_tour : keySchedule[nombre])


**Fonctionnement :** Applique XOR entre la clé et le message (init : Clé de l'utilisateur, tours : clés de tour générés avec la clé de l'utilisateur)


```
Pour chaque colonne de block **col** (numéro de colonne **i** allant de 1 à 4):
    **col** = **col** XOR clé_de_tour[i]
```

### SubBytes(block)

**Fonctionnement :**
Arithmétique : inverse multiplicatif puis une transformation affine (5.1)
Pratique : Utilisation de la boite de traduction (figure 7)

```
octet **c** = 01100011 (63)
**result** = 00000000
Pour chaque octet **oct**:
    Inverse multiplicatif du polynome représenté par oct
    Pour chaque bit dans oct (**i** allant de 0 à 8 (exclu)):
        **result**[i] = **oct**[i] XOR **oct**[(**i**+4) mod 8] XOR **oct**[(**i**+5) mod 8] XOR **oct**[(**i**+6) mod 8] XOR **oct**[(**i**+7) mod 8] XOR **c**[i]
```




### ShiftRows()

(première ligne ignorée)
```
Pour chaque ligne du block **b** (**r** allant de 2 à 4 ) :
    3*rotateLeft(**b**[r])

rotateLeft(line) :
    temp = line[1] (i.e premier octet)
    Pour **i** allant de 1 à 4 (exclu) :
        line[i] = line[i+1]
    line[4] = temp

```
(voir figure 8)

**OU** voir formule 5.3 et 5.4

Décalage à gauche des lignes, nombre de décalages correspondants au numéro de la ligne
Pratique : (voir formule 5.3)

### MixColumns()

Ici les colonnes sont considérées comme des polynômes à coefs dans Z256Z

```
a(x) = {03} x³ + {01} x² + {01} x + {02}

Pour chaque colonne **col** :
    col = (col * a(x)) mod (x⁴ +1)
```

Arithmétique : Multiplication des colonnes par le poly a donné (5.5) modulo l'irréductible dans Z256Z qui est x^4+1.
Pratique : Multiplication de matrice (5.6) et les différentes formules sont données en dessous de (5.6)

### Génération des clés de tour

La génération des clés de tour se trouent avec un algorithme très précis.

Dans notre implémentation, nous avons choisi de calculer l'entièreté des clés en même temps afon d'obtenir un tableau les contenant toutes, et ensuite choisir celle qui nous intéresse (cf. extract_round_key_from_key).

Le format de la clé étentue est toujours un tableaux de polynomes de Z256Z. Pour AES 128, avec 10 clés de tours plus celle de base, nous obtenons donc une liste de 176 éléments, qui est représenté par 11 blocks de 4 colonnes (words).

Explication de l'algorithme pour AES 128:

--> Les 4 premières colonnes sont le copie de la clé de base.
--> Les colonnes dont l'indice est multiple de 4 sont calculées à l'aide de op_spe
--> Les autres colonnes sont calculées à l'aide de op_normal

```
--                                (2)
--             (1)              op_spe
--   valeurs de la clé de base    ||            (3)
--    ||     ||     ||     ||     ||         op_normal
--    ||     ||     ||     ||     ||     ||     ||     ||
--    \/     \/     \/     \/     \/     \/     \/     \/
-- ------------------------------------------------------------------------------------------------
-- | c0,0 | c0,1 | c0,2 | c0,3 | c0,4 | c0,5 | c0,6 | c0,7 | .... | c0,41 | c0,42 | c0,43 | c0,44 |
-- | c1,0 | c1,1 | c1,2 | c1,3 | c1,4 | c1,5 | c1,6 | c1,7 | .... | c1,41 | c1,42 | c1,43 | c1,44 |
-- | c2,0 | c2,1 | c2,2 | c2,3 | c2,4 | c2,5 | c2,6 | c2,7 | .... | c2,41 | c2,42 | c2,43 | c2,44 |
-- | c3,0 | c3,1 | c3,2 | c3,3 | c3,4 | c3,5 | c3,6 | c3,7 | .... | c3,41 | c3,42 | c3,43 | c3,44 |
-- ------------------------------------------------------------------------------------------------
-- 
```

Voici le fonctionnement des diffétentes sous-fonctions :

**op_normal :**

op_normal applique un xor entre le mot (la colonne) correspondante au tour précédant (colonne-keyLength) et celle immédiatement précédante.

**op_spe :**

op_spe applique un xor entre :


    - la colonne correspondante au tour précédant (colonne-keyLength)
    - Une transformation spéciale de la colonne immédiatement précedante qui est elle meme un xor entre deux éléments :
        - l'application de la fonction s définie par la s-box appliquée sur les 4 éléments de la colonne plus une rotation de celle-ci
        - une colonne formée du polynome {02} à la puissance du numéro de colonne divisé par la longueur de la clé (colonne /keyLenght) -1




$$ 

word[4] = word[0] xor op_spe(word[3])
\newline

en \space notant : word[3] = \begin{pmatrix}
                                w30 \\
                                w31 \\
                                w32 \\
                                w33
                                \end{pmatrix}

\newline

op\_spe(word[3]) = \begin{pmatrix}
                    s(w31)\\
                    s(w32)\\
                    s(w33)\\
                    s(w30)\\
                    \end{pmatrix}

                    xor

                    \begin{pmatrix}
                    x^{(\frac{colonne}{keyLenght}) -1}\\
                    0\\
                    0\\
                    0\\
                    \end{pmatrix}

$$


**Pseudo code :**


```
KeyExpansion(byte key[4*Nk], word w[Nb*(Nr+1)], Nk)

    word temp
    i = 0
    while (i < Nk)
        w[i] = word(key[4*i], key[4*i+1], key[4*i+2], key[4*i+3])
        i = i+1

    i = Nk
    while (i < Nb * (Nr+1)]
        temp = w[i-1]
        if (i mod Nk = 0)
            temp = SubWord(RotWord(temp)) xor Rcon[i/Nk]
        else if (Nk > 6 and i mod Nk = 4)
            temp = SubWord(temp)

        w[i] = w[i-Nk] xor temp
        i = i + 1

KeyExpansion(clé_de_chiffrement, keySchedule : liste de clés, keyLength : (nombre de word))

    word temp
    i=0
    Tant que i < keyLentgh :
        keySchedule[i] = [clé_de_chiffrement[4*i+1], clé_de_chiffrement[4*i+1], clé_de_chiffrement[4*i+2], clé_de_chiffrement[4*i+3]]
        i= i + 1
    
    i = keyLength
    Tant que i < nombre de clés à générer (roundKey) :
        temp = keySchedule[i-1]
        if (i mod keyLentgh = 0)
            temp = SubWord(RotWord(temp)) xor Rcon[i/keyLentgh]
        else if (keyLentgh > 6 and i mod keyLentgh = 4)
            temp = SubWord(temp)

        keySchedule[i] = keySchedule[i-keyLentgh] xor temp
        i = i + 1

```