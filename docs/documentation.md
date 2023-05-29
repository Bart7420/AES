# Documentation du projet AES partie Haskell

Dans ce document est présenté nos choix de code ainsi que des exemples expliquant le fonctionnement de notre programme

<br>

## Fonctionnement AES

Les deux fonctions principales sont les suivantes, **cipher_aes** et **invcipher_aes**.

Les trois modes d'AES sont disponibles ! 128, 192 et 256
Pour changer de mode, il faut commenter et décommenter les bonnes lignes de constantes dans le fichier AesFunctions.hs (lignes 15 à 33)

<br>

>*__Exemples pour AES-128:__*
>
>**cipher_aes** : ```cipher_aes <plaintext> <cipher key>```
>```
>cipher_aes "61626364656631323334353637383930" "6B6B6B6B65656565797979792E2E2E2E" 
>
> 39 62 8B CC 
> C1 CD 48 E4 
> 5F DD B5 E8 
> 9C BF 9D 02
>```
>**invcipher_aes** : ```cipher_aes <ciphertext> <cipher key>```
>```
>invcipher_aes "39628BCCC1CD48E45FDDB5E89CBF9D02" "6B6B6B6B65656565797979792E2E2E2E" 
> 
> 61 62 63 64 
> 65 66 31 32 
> 33 34 35 36 
> 37 38 39 30
>```
**Note :** les "lettres" représentant les caractères hedadécimaux doivent êtres en majuscules

## Choix de la représentation des données

Nous avons plusieurs fonctions annexes autres que les fonctions de base d'aes :

Nous avons choisi de représenter les "words" d'aes en "ligne" pour plus de lisibilité. C'est a dire que les textes et clé sont codées w00 w10 w20 w30 w01 ...

<br>

>*__Exemple avec une clé d'aes 128 :__*
$$
w1 = \begin{pmatrix}
                                A1 \\
                                B1 \\
                                C1 \\
                                D1
                                \end{pmatrix}

w2 = \begin{pmatrix}
                                A2 \\
                                B2 \\
                                C2 \\
                                D2
                                \end{pmatrix}

w2 = \begin{pmatrix}
                                A3 \\
                                B3 \\
                                C3 \\
                                D3
                                \end{pmatrix}

w4 = \begin{pmatrix}
                                A4 \\
                                B4 \\
                                C4 \\
                                D4
                                \end{pmatrix}
$$
>On les "lis" en ligne en les convertissant en polynome de Z256Z (ici on garde la représentation hexadécimal pour une meillleure lisibilité)
>```
>[A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]
>```
>

Le fonctionnement de l'extension de clé est donc un peu différent de la méthode de la documentation car nous partons d'un tableau vide que nous remplissons au fur et a mesure, à l'aide des fonctions putColumn et pickColumns qui, respectivement remplissent la matrice avec un "word" et qui les retirent

### extract_round_key_from_key
Premet d'extraire une clé de trour de la clé étendue

<br>

## Autres fonctions permettant l'affichage et la manipulation des élements

<br>

### binToHex
Permet de transformer une liste de polynomes de Z256Z en une liste de caractères hexadécimaux

### hexToBin
Permet de transformer une chaine de caractères hexacécimaux en liste de polynomes de Z256Z à l'aide de la fonction convertCaraToBin qui converti un char en polynôme

### transpose
Permet de changer la position des polynomes dans la liste des polynômes pour avoir la même configuration que la documentation


