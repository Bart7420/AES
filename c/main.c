
#include <stdio.h>
int main(int argc,char *argv[])
{

    //printf("hello\n");

    // en c on peut utiliser les char (8 bits) pour representer un polynomes de Z2562 d'haskell
    // donc le texte est un tableau de 16 char

    char texte[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'h', 'k', 'l', 'm', 'n', 'o'};

    printf("%d est le premier element du tableau\n", texte[0]);

    return 0;

}