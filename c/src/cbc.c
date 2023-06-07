#include <string.h>
#include <stdlib.h>
#include <wmmintrin.h> 

#include "cbc.h"
#include "aes.h"
#include "io.h"


extern byte key[65];

void chiffrer_cbc(char input[100], char output[100], byte keyAes[65]) {

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
    
    byte initVector[16] = "";
    getInitVector(initVector);

    stateXor(state, initVector);
    cipher_cbc(extandedKey, state, nbRound);

    for (long long int i = 16; i < fileLength; i+=16)
    {
        stateXor(&state[i], &state[i-16]);
        cipher_cbc(extandedKey, &state[i], nbRound);
    }

    free(extandedKey);
    ecriture(output, state, fileLength, 0);
    free(data);
    
}
void dechiffrer_cbc(char input[100], char output[100], byte keyAes[65]){
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

    byte initVector[16] = "";
    getInitVector(initVector);

    for (long long int i = (fileLength-16); (i > 0) && (fileLength>16); i -= 16)
    {
        invcipher_cbc(extandedKey, &state[i], nbRound);
        stateXor(&state[i], &state[i-16]);
    }
    invcipher_cbc(extandedKey, state, nbRound);
    stateXor(state, initVector);

    free(extandedKey);
    ecriture(output, state, fileLength, 1);
    free(data);

}

void getInitVector(byte *vector){
    memcpy(vector, "0123456789abcdef", 16);
    // ATTENTION, l'init vector est fixé de façon simple
    // Si l'on veut une meilleure sécurité le generer aléatoirement
    // On pourrais également prendre la fin du fichier en tant que vecteur d'initialisation.
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

    #ifndef TEST
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

    #endif

    #ifdef PERF

    __m128i* state128 = (__m128i*) state;
    __m128i* key128 = (__m128i*) extandedKey;

    //addroundkey
    __m128i temp = _mm_xor_si128(*state128, *key128);
    _mm_store_si128(state128, temp);

    for(int round = 1; round < nbRound; round++){
        key128 = (__m128i*) &extandedKey[4*(round*4)];
        temp = _mm_aesenc_si128(*state128, *key128);
        _mm_store_si128(state128, temp);
    }
    key128 = (__m128i*) &extandedKey[4*(4*nbRound)];
    temp = _mm_aesenclast_si128(*state128, *key128);
    _mm_store_si128(state128, temp);

    #endif
}


void invcipher_cbc(byte *extandedKey, byte *state, int nbRound){

    #ifndef PERF

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

    #endif

    #ifdef PERF

    __m128i* state128 = (__m128i*) state;
    __m128i* key128 = (__m128i*) extandedKey;

    //addroundkey
    key128 = (__m128i*) &extandedKey[4*(4*nbRound)];
    __m128i temp = _mm_xor_si128(*state128, *key128);
    _mm_store_si128(state128, temp);

    for(int round = 1; round <= nbRound-1; round++){
    //for(int round = nbRound-1; round > 0; round--){
        key128 = (__m128i*) &extandedKey[4*(round*4)];
        temp = _mm_aesdec_si128(*state128, *key128);
        _mm_store_si128(state128, temp);
    }
    key128 = (__m128i*) extandedKey;
    temp = _mm_aesdeclast_si128(*state128, *key128);
    _mm_store_si128(state128, temp);

    #endif
}