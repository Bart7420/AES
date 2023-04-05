# PX222-IRC
Projet semestre 4

Objectif: Implémenter l'encodage AES en C

Etapes :
  - Implémenter les objets mathématiques de base en Haskell
  - Implémenter l'encodage AES en Haskell
  - Porter cette implémentation en C
  
## Jalons

|no |  action   |                                        nom                                                 |
|:--|:---------:|:-------------------------------------------------------------------------------------------|
| 1 |    ok     |  définition de classes de types pour Anneaux, Corps.                                       |
| 2 |    ok     |  implémentation du corps à 2 éléments F2 = GF(2) = Z/2Z                                    |
| 3 | en cours  |  Implémentation (types, +,-,x) des anneaux des polynômes à coefficients dans un corps.     |
| 4 |           |  tests de 3) sur des polynômes à coefficients dans F2                                      |
| 5 | reflexion |  implémentation du calcul modulo un polynôme (+,-,x)                                       |
| 6 |           |  tests de 5) avec le polynôme m d'AES                                                      |
| 7 |           |  implémentation de l'inverse modulo m dans F2[X]                                           |



## Séance 1 (21/03/23)

Durant cette séance, nous avons pris connaissance du sujet. Nous avons étudier la documentation AES fournie.
Ensuite, nous avons pris connaissance des fichiers de code fournis. Nous avons pu commencer à mettre en place les premières fonction.
Nous avons définit les classes de type Anneau et Corps en Haskell.
Nous avons ensuite réalisé l'implémentation du corps Z/2Z.
Pour finir, nous avons commencé à réfléchir à comment implémenter des anneaux de polynômes à coefficients dans un corps.

**Objectifs avant la prochaine séance :**
- Ronan :
    - Finir l'implémentation du 3)
    - Faire les tests du 3)
    - Réfléchir à une implémentation du calcul modulo un polynôme
    
- Etienne
    - Réfléchir à une implémentation du calcul modulo un polynôme
    - Faire les tests du 5)
