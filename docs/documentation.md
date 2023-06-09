# Documentation du projet AES 


## Haskell

Dans ce document est présenté nos choix de code ainsi que des exemples expliquant le fonctionnement de notre programme

<br>

### Fonctionnement AES

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

### Choix de la représentation des données

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

### Autres fonctions permettant l'affichage et la manipulation des élements

<br>

### binToHex
Permet de transformer une liste de polynomes de Z256Z en une liste de caractères hexadécimaux. La fonction prend en plus un entier en paramètre qui reprèsente le nombre de word contenu dans la liste.

### hexToBin
Permet de transformer une chaine de caractères hexacécimaux en liste de polynomes de Z256Z à l'aide de la fonction convertCaraToBin qui converti un char en polynôme

### transpose
Permet de changer la position des polynomes dans la liste des polynômes pour avoir la même configuration que la documentation


## Deuxième parite en C

Voici le fonctionnement et les modes de compilation possibles pour la parite c du projet.


### <u>AES sur un bloc </u>

Compilation du main :

deux options pour compiler le main :

*__Simple AES__*

>```make main saes=1 -B```

Codage simmple d'une state avec unterface utilisateur sur le terminal

>```make main test=1 -B```

Ce mode de compilation execute la série de tests sur le programme aes



### <u>Codage de fichiers</u>


Deux mode de codage des fichiers sont disponibles, le mode standard et le mode eval.

__Mode standard__ <br>
Le fichier est lu en ajoutant des zéros à la fin pour le completer de la taille d'une state, et le nombre de zéro rajoutés est placé comme valeur du dernier. Comme cela, lors du décodage, il suffit de récupérer cette valeur pour connaitre le nombre d'octets à retirer.

__Mode éval__ <br>
Ici, le fichier est lu sans prendre en compte la taille. On ajoute ensuite la taille du fichier sur les 4 premiers octets. On commplète alors avec des zero pour atteindre un multiple de 16 qui correspond à un nombre entier de state d'aes. C'est alors qu'on encode le résultat. Pour le décodage, c'est une fois tout décodé que l'on récupère la taille et récupérer le fichier d'origine.

__Mode performance__ <br>
Pour améliorer les performances, on peut ajouter ```perf=1``` dans la commande make pour utiliser les instructions processeur aes.

__Attention : librairie graphique__ <br>
Si la librairie graphique n'est pas installée (gtk 3), il faut ajouter ```lib=1``` pour compiler sans la librairie.
De nombreux warnings peuvent apparaitre a la compilation, notamment sur des problèmes de type. Ceux-ci sont "normaux" ce sont des problèmes de cast entre les types des éléments graphique, qui sont nécessaires pour le bon fonctionnement de l'interface.



*__ECB__*

Différents modes, mode eval et mode normal :

>```make ecb_aes -B``` <br>
>```make ecb_aes eval=1 -B```


Usage : "mode" "path entree" "path sortie" "cle" <br>
mode : "encode", "decode"

Permet d'encoder et de décoder un fichier en utilisant la méthode ecb.<br>
Le mode eval place le taille du fichier sur les 4 premiers octects du fichier encodé.
Sans ce mode, c'est le méthode standard qui est utilisée.


*__CBC__*

Différents modes, mode eval et mode normal :

>```make cbc_aes -B``` <br>
>```make cbc_aes eval=1 -B```


Usage : "mode" "path entree" "path sortie" "cle" <br>
&ensp; mode : "encode", "decode"

Permet d'encoder et de décoder un fichier en utilisant la méthode ecb.<br>
Le mode eval place le taille du fichier sur les 4 premiers octects du fichier encodé.
Sans ce mode, c'est le méthode standard qui est utilisée.



### <u>Codage des bmp</u>

Pour coder des images bmp et pouvoir les ouvrir une fois codées, il nous afut conserver l'en-tête du fichier identique pour la reconnaissance du fichier.

Nous utilisons alors un nouveau mode de compilation.

>```make bmp_aes -B``` <br>
>```make cbc_aes eval=1 -B```

Usage : "mode" "version" "path entree" "path sortie" "cle" <br>
&ensp; mode : "encode", "decode"  <br>
&ensp; version : "ecb", "cbc" 

C'est avec cette methode que l'on peut calculer l'entropie et observer le défaut de la méthode ecb, qui ne cache pas réelement les informations.



### <u>Interface graphique</u>

Nous avons implémenté une interface graphique pour rendre plus facile les manipulations de fichiers et le gestion de tous les modes d'AES. Elle se compile comme il suit :

>```make graphic_aes -B``` <br>
>```make cbc_graphic_aes eval=1 -B```

Pulsieurs fonctionnalitées sont disponibles :

- Choix de fichier d'entrée et de sortie
- Deux modes d'entrée de clé d'encodage
- Choix du mode d'encryption (ECB ou CBC)
- Un mode l'encryption des fichiers BMP
- Un affichage des statistiques d'encryption
  
#### Entrée de la clé :

Deux options sont disponibles. Par défaut, l'utilisateur peut entrer un mot de passe de 100 caractère max pour l'encodage de ses fichiers. La clé sera le SHA256 du mot de passe et AES 256 sera utilisé.<br> Si la case ```HEXA``` est cochée, la clé entrée devra être en hexadécimal. Selon la taille de la clé, 32, 48 ou 64, le mode d'AES correspondant est choisi pour l'encodage.

#### Mode BMP

Si la case ```BMP``` est cochée, l'encodage garde l'en-tête du fichier bmp pour pouvoir l'ouvrir une fois codé pour visualiser la différence entre cbc et ecb.

#### Note : 
Les boutons de séléction de la version aes ne sont pas fonctionnels, la version sera séléctionnée en fonction de la taille de la clé héxadécimale.
