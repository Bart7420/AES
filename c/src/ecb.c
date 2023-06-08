#include <string.h>
#include <stdlib.h>
#include <sys/time.h>

#include "cbc.h"
#include "aes.h"
#include "io.h"
#include "ecb.h"


double chiffrer_ecb(char input[100], char output[100], byte keyAes[65], int keyLength){

    long long int fileLength = 0;
    byte *data = NULL;

    data = lecture(input, &fileLength, 1);

    //Mesure du temps
    struct timeval debut;
    struct timeval fin;
    gettimeofday(&debut, 0);
    
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

    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;

    ecriture(output, state, fileLength, 0);
    free(data);

    return temps;
}

double dechiffrer_ecb(char input[100], char output[100], byte keyAes[65], int keyLength){

    long long int fileLength = 0;
    byte *data = NULL;

    data = lecture(input, &fileLength, 0);

    //Mesure du temps
    struct timeval debut;
    struct timeval fin;
    gettimeofday(&debut, 0);

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

    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;

    ecriture(output, state, fileLength, 1);
    free(data);
    return temps;
}