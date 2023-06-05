#include <string.h>
#include <stdlib.h>


#include "cbc.h"
#include "aes.h"
#include "conversion.h"
#include "io.h"


extern byte key[65];

void chiffrer_cbc() {

    // Key
    int keyLength = strlen(key)/4;


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
    

    stateXor(state, key);
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
    int keyLength = strlen(key)/4;


    int fileLength = 0;
    byte *data = NULL;

    data = lecture(&fileLength);

    byte *state = &data[fileLength-16];


    int nbRound;
    if(keyLength == 4){
        nbRound = 10;
    } else if(keyLength == 6){
        nbRound = 12;
    } else if (keyLength == 8){
        nbRound = 14;
    }

    byte *extandedKey = keyExpansion(key, keyLength, nbRound);

    
    for (long long int i = (fileLength-16); (i > 0) && (fileLength>16); i -= 16)
    {
        invcipher_cbc(extandedKey, &state[i], nbRound);
        stateXor(&state[i-16], &state[i]);
    }
    invcipher_cbc(extandedKey, state, nbRound);
    stateXor(state, key);

    free(extandedKey);
    ecriture(state, fileLength);

}


void stateXor(byte state[16], byte xorwith[16]){
    for (int i = 0; i<16; i++) {
        state[i] = state[i] ^ xorwith[i];
    }

   /* for (int i = 0; i < 16; i=i+4) {
        xor(&state[i], &xorwith[i], &state[i]);
    }*/
    
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