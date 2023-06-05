# PX222-IRC
Projet semestre 4

Objectif: Implémenter l'encodage AES en C

Etapes :
  - Implémenter les objets mathématiques de base en Haskell
  - Implémenter l'encodage AES en Haskell
  - Porter cette implémentation en C

<br>

## Compilation

Pour compiler l'interface graphique, il faut installer la librarie gtk comme ci-dessous :


> ```sudo apt install gtk-3-dev```


## Documents
- [Carnet de bord](./docs/carnet_bord.md)
- [Documentation](./docs/documentation.md)
- [Fichier récapitulant le fonctionnement d'aes](./docs/fonctionnement_aes.md)

<br>


## Planning

Séance 1, 2, 3 -> Haskell, algèbre et doc

Séances 4, 5 -> début d'appropriation des tâches liées au c

<br>

## Jalons

|no |  action   |                                        nom                                                 |
|:--|:---------:|:-------------------------------------------------------------------------------------------|
| 1 |    ok     |  définition de classes de types pour Anneaux, Corps.                                       |
| 2 |    ok     |  implémentation du corps à 2 éléments F2 = GF(2) = Z/2Z                                    |
| 3 |    ok     |  Implémentation (types, +,-,x) des anneaux des polynômes à coefficients dans un corps.     |
| 4 |    ok     |  tests de 3) sur des polynômes à coefficients dans F2                                      |
| 5 |    ok     |  implémentation du calcul modulo un polynôme (+,-,x)                                       |
| 6 |    ok     |  tests de 5) avec le polynôme m d'AES                                                      |
| 7 | ok  |  implémentation de l'inverse modulo m dans F2[X]                                           |
| 8 |      ok    |  tests du 7                                                                                |
| 9 |           |                                                                                            |
| 10|           |                                                                                            |


<br>

## Auteurs
- Arnaud-Goddet Etienne (alias bart7420)
- Veysseire Ronan (alias Rgoplay)