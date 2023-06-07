# Carnet de bord

## Séance 1 (21/03/23)

Durant cette séance, nous avons pris connaissance du sujet. Nous avons étudier la documentation AES fournie.
Ensuite, nous avons pris connaissance des fichiers de code fournis. Nous avons pu commencer à mettre en place les premières fonction.
Nous avons définit les classes de type Anneau et Corps en Haskell.
Nous avons ensuite réalisé l'implémentation du corps Z/2Z.
Pour finir, nous avons commencé à réfléchir à comment implémenter des anneaux de polynômes à coefficients dans un corps.

**Objectifs avant la prochaine séance :**
- Ronan :
    - [x] Finir l'implémentation du 3)
    - [x] Faire les tests du 3)
    - [x] Réfléchir à une implémentation du calcul modulo un polynôme
    
- Etienne
    - [x] Réfléchir à une implémentation du calcul modulo un polynôme
    - [x] Faire les tests du 5)

<br>

## Séance 2 (5/04/2023)

Dans cette deuxième séance, nous avons continué l'implémentation en haskell, notamanet en commencant l'inverse module m dans un corps.
Nous avons aussi résolu les nombreux bugs des fonctions déja existantes.
Nous avons ré-étudié la documentation de AES, en se focalisant sur le fonctionnement global du système AES, por avoir une vue plus globale du projet.


**Objectifs avant la prochaine séance :**
- Ronan :
    - [x] Continuer l'étude de la documentation en général
    - [x] DOC
    
- Etienne
    - [x] Faire les tests du 7)
    - [x] Continuer l'étude de la documentation notament en point 4.3

<br>

## Séance 3 (18/04/2023)

Dans cette séance, nous avons continué l'implémentation d'AES. Nous avons commencé les implémentations de SubBytes() et de ShiftRows() d'aes.


**Objectifs avant la prochaine séance :**
- Ronan :
    - [x] MixColumn
    - [x] InvMixColums
    - [x] ShiftRow
    - [x] InvShiftRow
    - [x] KeyExpension
    - [x] tests
    
- Etienne
    - [x] SubBytes
    - [x] InvSubBytes
    - [x] AddRoundKey
    - [x] InvAddRoundKey
    - [x] KeyExpension
    - [x] tests

<br>

## Séance 4 (3/05/2023)

Dans cette séance, nous avons continué l'implémentation d'aes en haskell. Nous avons continué/fini l'implémentation de KeyExpension, puis nous avons mis en place Cipher et InvCipher. Nous avons eu quelques bugs a corriger. Nous avons aussi commencé l'extension de clé pour les autres versions de AES, 192 et 256.

**Objectifs avant la prochaine séance :**
- Ronan :
    - [x] Extension de clé pour les autres versions de AES (192, 256)
    - [x] tests extension clé
    - [x] test cipher 192 et 256
    - [x] (en c) codage shiftRow et son inverse
    - [x] Rédaction d'une documentation
    
- Etienne
    - [x] Corrections et vérification de Cipher et InvCipher
    - [x] tests
    - [x] Rédaction d'une documentation
    - [x] Début du C, reflexion à la structure de donnée à utiliser
    - [x] (en c) codage AddRoundKey
    - [x] (en c) codage SubBytes
    - [x] (en c) codzage InvSubBytes

<br>

## Séance 5 (17/05/2023)
Durant la séance nous avons débuggé les version aes 192 et 256 qui sont maintenant fonctionnelles et avons rédigés des tests pour celles-ci. Nous avons aussi réorganisé le code et commenter les focntions.
Nous avons continuer l'implémentation d'aes en C.

**Objectifs avant la prochaine séance :**
- Ronan :
    - [x] Continuer la documentation
    - [x] Nettoyer le code
    - [x] Continuer le C

- Etienne :
    - [x] Continuer et finir la documentation
    - [x] Continuer le C

 
# Deuxième période

## Séance 6 (5/06/2023)
Durant la séance nous avons continué le code en c.
Nous avons fini l'interface graphique que nous avions commencé dans l'entre-période. 
Nous avons réalisé l'algorithme CBC pour coder et décoder des fichiers de manière fiable.
Nous avons passé beaucoup de temps a debuggé nos programmes.

**Objectifs de la séance :**
- Ronan :
    - [x] Algorithme CBC
    - [x] Correction AES version terminal

- Etienne :
    - [x] Continuer l'interface graphique et l'integrer dans le code
    - [x] Gérer la lecture et l'écriture des fichiers


## Séance 7 (6/06/2023)

Durant cette deuxième séance de la deuxième période, nous allons continuer a implémenter la version CBC d'aes.

Nous avons commencé par utiliser l'outil callgrind, utilisé comme ceci :

> ```valgrind --tool=callgrind <programme>```

Ce qui permet de générer un fichier contenant tout les points de mesures du logiciel. Nous avons eu des problèmes car il n'executait pas le fichier, cer nous avions laissé fsanitize dans les options de compilations. <br> Une fois le fichier de mesures obtenu, nous avons utilisé l'interface de kcachegrind et ouvert le fichier. <br> Nous avons obtenu le graph ci-dessous.
![Alt text](opti.png "perf")

Nous avons alors essayé de trouver des solutions pour optimiser le code, notement de multpoly qui est appelé plus de 33 millions de fois pour encoder un fichier de 1,8mo. <br> <br>

Après avoir recu l'extension de sujet par mail, nous avons implémenté le mode ECB en mode cryptage et décryptage. <br> <br>

Nous avons ensuite codé une fonction pour encoder des fichiers BMP selon les deux modes : ECB et CBC. Nous avons observé le défaut de ECB en observant l'image. <br> <br> <br>

Image Originale
![Alt text](entree.bmp "origine")
Image encodée ECB
![Alt text](sortie_ecb.bmp "ecb")
Image encodée CBC
![Alt text](sortie_cbc.bmp "cbc")



**Objectifs de la séance :**
- Ronan :
    - [x] Algorithme CBC
    - [x] Algorithme ECB
    - [x] Essai optimisation registre processeur

- Etienne :
    - [x] Optimisation du code
    - [x] Coder des fichiers bmp en ecb et cbc
    - [x] ui

