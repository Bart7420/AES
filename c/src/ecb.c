#include <string.h>
#include <stdlib.h>


#include "cbc.h"
#include "aes.h"
#include "io.h"
#include "ecb.h"


void chiffrer_ecb(char input[100], char output[100], byte keyAes[65]){
    // Key
    int keyLength = strlen((char*) keyAes)/4;

    int fileLength = 0;
    byte *data = NULL;

    data = lecture(input, &fileLength, 1);

    byte *state = data;

    int nbRound = 0;
    if(keyLength == 4){
        nbRound = 10;
    } else if(keyLength == 6){
        nbRound = 12;
    } else if (keyLength == 8){
        nbRound = 14;
    }

    byte *extandedKey = keyExpansion(keyAes, keyLength, nbRound);


    for (long long int i = 0; i < fileLength; i+=16)
    {
        cipher_cbc(extandedKey, &state[i], nbRound);
    }

    free(extandedKey);
    ecriture(output, state, fileLength, 0);
    free(data);
}

void dechiffrer_ecb(char input[100], char output[100], byte keyAes[65]){
    // Key
    int keyLength = strlen((char*) keyAes)/4;

    int fileLength = 0;
    byte *data = NULL;

    data = lecture(input, &fileLength, 0);

    byte *state = data;


    int nbRound = 0;
    if(keyLength == 4){
        nbRound = 10;
    } else if(keyLength == 6){
        nbRound = 12;
    } else if (keyLength == 8){
        nbRound = 14;
    }

    byte *extandedKey = keyExpansion(keyAes, keyLength, nbRound);

    for (long long int i = (fileLength-16); (i >= 0) && (fileLength>16); i -= 16)
    {
        invcipher_cbc(extandedKey, &state[i], nbRound);
    }

    free(extandedKey);
    ecriture(output, state, fileLength, 1);
    free(data);
}