#include "cbc.h"
#include "aes.h"
#include "conversion.h"

extern key[65];

void chiffrer_cbc() {

    // Key
    int keyLength = strlen(key)/8;
    byte *aes_key = malloc(keyLength*8);
    strToWords(key, aes_key, keyLength*8);

    int fileLength = 0;
    byte *data = NULL;

    data = lecture(&fileLength);

    byte *state = data;

    int nbRound;
    if(keyLength == 4){
        nbRound = 10;
    } else if(keyLength == 6){
        nbRound = 12;
    } else if (keyLength == 8){
        nbRound = 14;
    }

    byte *extandedKey = keyExpansion(key, keyLength, nbRound);
    

    stateXor(state, aes_key);
    cipher_cbc(extandedKey, state, nbRound);

    for (long long int i = 16; i < fileLength; i+=16)
    {
        stateXor(&state[i], &state[i-16]);
        cipher_cbc(extandedKey, &state[i], nbRound);
    }

    free(extandedKey);
    ecriture(state, fileLength);
    
}
void dechiffrer_cbc(){
    // Key
    int keyLength = strlen(key)/8;
    byte *aes_key = malloc(keyLength*8);
    strToWords(key, aes_key, keyLength*8);

    int fileLength = 0;
    byte *data = NULL;

    data = lecture(&fileLength);

    byte *state = data[fileLength-16];


    int nbRound;
    if(keyLength == 4){
        nbRound = 10;
    } else if(keyLength == 6){
        nbRound = 12;
    } else if (keyLength == 8){
        nbRound = 14;
    }

    byte *extandedKey = keyExpansion(key, keyLength, nbRound);

    
    for (long long int i = (fileLength-16); i > 0; i -= 16)
    {
        invcipher_cbc(extandedKey, &state[i], nbRound);
        stateXor(&state[i-16], &state[i]);
    }
    invcipher_cbc(extandedKey, state, nbRound);
    stateXor(state, aes_key);

    free(extandedKey);
    ecriture(state, fileLength);

}


void stateXor(byte *state, byte *xorwith){
    for (int i = 0; i < 4; i++)
    {
        xor(&state[0], &xorwith[0], &state[0]);
    }
    
}

void cipher_cbc(byte *extandedKey, byte *state, int nbRound){

    addRoundKey(state, &extandedKey[0]);

    for(int round = 1; round < nbRound; round++){
        subBytes(state);
        shiftRows(state);
        mixColumn(state);
        addRoundKey(state, &extandedKey[4*(round*4)]);
    }

    subBytes(state);
    shiftRows(state);
    addRoundKey(state, &extandedKey[4*(4*nbRound)]);

}

void invcipher_cbc(byte *extandedKey, byte *state, int nbRound){

    addRoundKey(state, &extandedKey[4*(4*nbRound)]);

    for(int round = nbRound-1; round > 0; round--){
        invShiftRows(state);
        invSubBytes(state);
        addRoundKey(state, &extandedKey[4*(4*round)]);
        invMixColumn(state);
    }

    invShiftRows(state);
    invSubBytes(state);
    addRoundKey(state, &extandedKey[0]);
}