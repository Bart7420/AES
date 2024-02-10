# PX222-IRC
Projet semestre 4

Objectif: Implémenter l'encodage AES en C

Etapes :
  - Implémenter les objets mathématiques de base en Haskell
  - Implémenter l'encodage AES en Haskell
  - Porter cette implémentation en C

<br>

## Description fonctionnalités

- Encodages AES disponibles : 128, 192, 256
- Mode encodage des fichiers : CBC, ECB
- Clé d'encodage : HEXA ou texte (uniquement en AES 256 pour le moment)
- Encodage des BMP sans header + calcul entropie

<br> Note : toute les combinaisons sont possible
<br>
## Compilation graphique

Pour compiler l'interface graphique, il faut installer la librarie gtk indiqué ci-dessous :


> ```sudo apt install gtk-3-dev libvte-2.91-dev```

Ensuite, dans le dossier c, compiler avec la commande :
> ```make graphic_aes -B```

Pour lancer : 

> ```./graphic_aes```

Pour les autres modes de compilation, voir le fichier de documentation.


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