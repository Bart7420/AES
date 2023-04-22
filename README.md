# PX222-IRC
Projet semestre 4

Objectif: Implémenter l'encodage AES en C

Etapes :
  - Implémenter les objets mathématiques de base en Haskell
  - Implémenter l'encodage AES en Haskell
  - Porter cette implémentation en C
  


## Planing

Séance 1, 2, 3 -> Haskell, algèbre et doc

Séances 4, 5 -> début d'appropriation des tâches liées au c





## Jalons

|no |  action   |                                        nom                                                 |
|:--|:---------:|:-------------------------------------------------------------------------------------------|
| 1 |    ok     |  définition de classes de types pour Anneaux, Corps.                                       |
| 2 |    ok     |  implémentation du corps à 2 éléments F2 = GF(2) = Z/2Z                                    |
| 3 |    ok     |  Implémentation (types, +,-,x) des anneaux des polynômes à coefficients dans un corps.     |
| 4 |    ok     |  tests de 3) sur des polynômes à coefficients dans F2                                      |
| 5 |    ok     |  implémentation du calcul modulo un polynôme (+,-,x)                                       |
| 6 |    ok     |  tests de 5) avec le polynôme m d'AES                                                      |
| 7 | en cours  |  implémentation de l'inverse modulo m dans F2[X]                                           |
| 8 |           |  tests du 7                                                                                |
| 9 |           |                                                                                            |
| 10|           |                                                                                            |
| 11|           |                                                                                            |
| 12|           |                                                                                            |
| 13|           |                                                                                            |
| 14|           |                                                                                            |
| 15|           |                                                                                            |
| 16|           |                                                                                            |
| 17|           |                                                                                            |



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


## Séance 3 (18/04/2023)

Dans cette séance, nous avons continué l'implémentation d'AES. Nous avons commencé les implémentations de SubBytes() et de ShiftRows(). 


**Objectifs avant la prochaine séance :**
- Ronan :
    - [ ] MixColumn
    - [ ] InvMixColums
    - [ ] ShiftRow
    - [ ] InvShiftRow
    - [ ] KeyExpension
    - [ ] tests
    
- Etienne
    - [x] SubBytes
    - [x] InvSubBytes
    - [ ] AddRoundKey
    - [ ] InvAddRoundKey
    - [ ] KeyExpension
    - [ ] tests



3 mai prochaine séance