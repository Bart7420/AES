#include <stdio.h>
#include <string.h>
#include "main.h"

#ifdef TEST    
#include "tests.h"
#endif
#ifdef CMD
#include "cmd_aes.h"
#endif
#ifdef GRAPHIC
#include "graphic_aes.h"
#endif

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

    // en c on peut utiliser les char (8 bits) pour representer un polynomes de Z2562 d'haskell
    // donc le texte est un tableau de 16 char


    // tests

    unsigned char texte[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    unsigned char texte2[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    unsigned char test_mix[16] = {0xd4, 0xbf, 0x5d, 0x30, 0xe0, 0xb4, 0x52, 0xae, 0xb8, 0x41, 0x11, 0xf1, 0x1e, 0x27, 0x98, 0xe5};
    unsigned char state[16] = {0xd4, 0xbf, 0x5d, 0x30, 0xe0, 0xb4, 0x52, 0xae, 0xb8, 0x41, 0x11, 0xf1, 0x1e, 0x27, 0x98, 0xe5};
    char attendu1[] = "046681e5e0cb199a48f8d37a2806264c";


    #ifdef TEST    
    all_tests();
    #endif
    #ifdef CMD
    cmdAes();
    #endif
    #ifdef GRAPHIC
    graphicAes();
    #endif

    return 0;
}

