# Fonctionnement de AES

AES-128

Length cipher key = 128
Length text = 128

Nb = 4 car 4*32bit (si un word = 32 bit) (taille des block (nb word))
Nr = 10 (nombre de tours)
Nk = 4 (key length)


## Codage :

Pour cette version (128) 10 tours composé de : init - 9 tours - tour final

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

```
Pour chaque colonne de block **col** (numéro de colonne **i** allant de 1 à 4):
    **col** = **col** XOR clé_de_tour[i]
```

Pratique : Applique XOR entre la clé et le message (init : Clé de l'utilisateur, tours : clés de tour générés avec la clé de l'utilisateur)

### SubBytes(block)

```
octet **c** = 01100011 (63)
**result** = 00000000
Pour chaque octet **oct**:
    Inverse multiplicatif du polynome représenté par oct
    Pour chaque bit dans oct (**i** allant de 0 à 8 (exclu)):
        **result**[i] = **oct**[i] XOR **oct**[(**i**+4) mod 8] XOR **oct**[(**i**+5) mod 8] XOR **oct**[(**i**+6) mod 8] XOR **oct**[(**i**+7) mod 8] XOR **c**[i]
```


Arithmétique : inverse multiplicatif puis une transformation affine (5.1)
Pratique : Utilisation de la boite de traduction (figure 7)

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

## Génération des clés de tour

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