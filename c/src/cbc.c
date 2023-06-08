#include <string.h>
#include <stdlib.h>
#include <wmmintrin.h> 
#include <sys/time.h>

#include "cbc.h"
#include "aes.h"
#include "io.h"


extern byte key[65];

double chiffrer_cbc(char input[100], char output[100], byte keyAes[65], int keyLength) {

    keyLength = keyLength/8; // Conversion longueur cle vers taille de cle AES

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

    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;

    ecriture(output, state, fileLength, 0);
    free(data);

    return temps;
}
double dechiffrer_cbc(char input[100], char output[100], byte keyAes[65], int keyLength){

    keyLength = keyLength/8; // Conversion longueur cle vers taille de cle AES

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

    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;

    ecriture(output, state, fileLength, 1);
    free(data);

    return temps;
}

void getInitVector(byte *vector){
    memcpy(vector, "DDDDDDDDDDDDDDDD", 16);
    // ATTENTION, l'init vector est fixé de façon simple
    // Si l'on veut une meilleure sécurité le generer aléatoirement
    // On pourrais également prendre la fin du fichier en tant que vecteur d'initialisation.
}


void stateXor(byte state[16], byte xorwith[16]){
    /*
    for (int i = 0; i<16; i++) {
        state[i] = state[i] ^ xorwith[i];
    }*/

   /* for (int i = 0; i < 16; i=i+4) {
        xor(&state[i], &xorwith[i], &state[i]);
    }*/

    __m128i* state128 = (__m128i*) state;
    __m128i* xorwith128 = (__m128i*) xorwith;
    *state128 = _mm_xor_si128(*state128, *xorwith128);
    //_mm_store_si128(state128, xor_result);
    
    
}

void cipher_cbc(byte *extandedKey, byte *state, int nbRound){

    #ifndef PERF
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
    *state128 = _mm_xor_si128(*state128, *key128);
    //_mm_store_si128(state128, temp);

    for(int round = 1; round < nbRound; round++){
        //key128 = (__m128i*) &extandedKey[4*(round*4)];
        *state128 = _mm_aesenc_si128(*state128, key128[round]);
        //_mm_store_si128(state128, temp);
    }
    //key128 = (__m128i*) &extandedKey[4*(4*nbRound)];
    *state128 = _mm_aesenclast_si128(*state128, key128[nbRound]);
    //_mm_store_si128(state128, temp);

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

    unsigned char key_schedule_decrypt[(nbRound+1) * 16];

    /*((__m128i*)key_schedule_decrypt)[0] = ((__m128i const*)extandedKey)[nbRound];

    if(nbRound>10){
        (((__m128i*)key_schedule_decrypt)[11]) = _mm_aesimc_si128(((__m128i*)extandedKey)[nbRound-11]);
        (((__m128i*)key_schedule_decrypt)[10]) = _mm_aesimc_si128(((__m128i*)extandedKey)[nbRound-10]);
    }
    if(nbRound>12){
        (((__m128i*)key_schedule_decrypt)[13]) = _mm_aesimc_si128(((__m128i*)extandedKey)[nbRound-13]);
        (((__m128i*)key_schedule_decrypt)[12]) = _mm_aesimc_si128(((__m128i*)extandedKey)[nbRound-12]);
    }

    for (int j = 1; j < nbRound; j++) {
        ((__m128i*)key_schedule_decrypt)[j] = _mm_aesimc_si128(((__m128i const*)extandedKey)[nbRound - j]);
    }

    ((__m128i*)key_schedule_decrypt)[14] = ((__m128i const*)extandedKey)[0];*/
    
    ((__m128i*)key_schedule_decrypt)[nbRound] = ((__m128i const*)extandedKey)[0];

    
    for (int j = 1; j < nbRound; j++) {
        ((__m128i*)key_schedule_decrypt)[nbRound - j] = _mm_aesimc_si128(((__m128i const*)extandedKey)[j]);
    }

    if(nbRound>10){
        (((__m128i*)key_schedule_decrypt)[nbRound-10]) = _mm_aesimc_si128(((__m128i*)extandedKey)[10]);
        (((__m128i*)key_schedule_decrypt)[nbRound-11]) = _mm_aesimc_si128(((__m128i*)extandedKey)[11]);
    }
    if(nbRound>12){
        (((__m128i*)key_schedule_decrypt)[nbRound-12]) = _mm_aesimc_si128(((__m128i*)extandedKey)[12]);
        (((__m128i*)key_schedule_decrypt)[nbRound-13]) = _mm_aesimc_si128(((__m128i*)extandedKey)[13]);
        
    }

    ((__m128i*)key_schedule_decrypt)[0] = ((__m128i const*)extandedKey)[nbRound];



    key128 = (__m128i*) key_schedule_decrypt;
    //addroundkey
    //key128 = (__m128i*) &extandedKey[4*(4*nbRound)];
    key128 = (__m128i*) key_schedule_decrypt;
    *state128 = _mm_xor_si128(*state128, *key128);
   // _mm_store_si128(state128, temp);


    for(int round = 1; round < nbRound; round++){
        //key128 = (__m128i*) &extandedKey[4*(round*4)];
        //key128 = (__m128i*) &key_schedule_decrypt[4*(round*4)];
        *state128 = _mm_aesdec_si128(*state128, key128[round]);
        //_mm_store_si128(state128, temp);
    }
    //key128 = (__m128i*) extandedKey;
    //key128 = (__m128i*) &key_schedule_decrypt[4*(4*nbRound)];
    *state128 = _mm_aesdeclast_si128(*state128, key128[nbRound]);
    //_mm_store_si128(state128, temp);

    #endif
}