
#include <stdio.h>
#include "aes.h"
#include <string.h>
#include "tests.h"

void afficher_state(unsigned char *state) {
    printf("output :");
    for (int i = 0; i < 16; i++)
    {
        
        printf("%2X ", state[i]);
        
    }
    printf("\n");
    
}

int main(int argc,char *argv[])
{

    // CONSTANTES
    int keyLength = 4;
    int nbRound = 10;
    //printf("hello\n");

    // en c on peut utiliser les char (8 bits) pour representer un polynomes de Z2562 d'haskell
    // donc le texte est un tableau de 16 char

    typedef unsigned char Word[4];


    // tests

    unsigned char texte[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    unsigned char texte2[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    unsigned char out[16];
    
    //printf("%d\n", texte[2]*texte2[2]);


    subBytes(texte);
    invSubBytes(texte);
    shiftRows(texte);


    unsigned char test_mix[16] = {0xd4, 0xbf, 0x5d, 0x30, 0xe0, 0xb4, 0x52, 0xae, 0xb8, 0x41, 0x11, 0xf1, 0x1e, 0x27, 0x98, 0xe5};
    mixColumn(test_mix);
    //subBytes(test_mix);
    afficher_state(test_mix);


    
    unsigned char state[16] = {0xd4, 0xbf, 0x5d, 0x30, 0xe0, 0xb4, 0x52, 0xae, 0xb8, 0x41, 0x11, 0xf1, 0x1e, 0x27, 0x98, 0xe5};
    
    all_tests();

    return 0;
}

