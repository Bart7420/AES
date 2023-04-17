# Fonctionnement de AES (vu en première lecture)

AES-128

Lenght clé = 128
Lenght text = 128


## Codage :
Composé pour cette version (128) de : init - 9 tours - tour final

### AddRoundKey()

Pratique : Applique XOR entre la clé et le message (init : Clé de l'utilisateur, tours : clés de tour générés avec la clé de l'utilisateur)

### SubBytes()

Arithmétique : inverse multiplicatif puis une transformation affine (5.1)
Pratique : Utilisation de la boite de traduction (figure 7)

### ShiftRows()

Décalage à gauche des lignes, nombre de décalages correspondants au numéro de la ligne
Pratique : (voir formule 5.3)

### MixColumns()

Ici les colonnes sont considérées comme des polynômes à coefs dans Z256Z
Arithmétique : Multiplication des colonnes par le poly a donné (5.5) modulo l'irréductible dans Z256Z qui est x^4+1.
Pratique : Multiplication de matrice (5.6) et les différentes formules sont données en dessous de (5.6)

## Génération des clés de tour

-- a étudier