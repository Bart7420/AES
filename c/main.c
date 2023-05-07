
#include <stdio.h>
#include "aes.h"
int main(int argc,char *argv[])
{

    // CONSTANTES
    int keyLength = 4;
    int nbRound = 10;
    //printf("hello\n");

    // en c on peut utiliser les char (8 bits) pour representer un polynomes de Z2562 d'haskell
    // donc le texte est un tableau de 16 char




    // tests

    unsigned char texte[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    unsigned char out[16];
    

    subBytes(texte);
    invSubBytes(texte);

    for (int i = 0; i < 16; i++)
    {
        printf("element %d du tableau est : %x \n", i, texte[i]);
    }
    
    return 0;
}