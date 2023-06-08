typedef unsigned char byte;
double chiffrer_cbc(char input[100], char output[100], byte keyAes[65], int keyLength);
double dechiffrer_cbc(char input[100], char output[100], byte keyAes[65], int keyLength);
void cipher_cbc(byte *extandedKey, byte *state, int nbRound);
void stateXor(byte *state, byte *xorwith);
void invcipher_cbc(byte *extandedKey, byte *state, int nbRound);
void getInitVector(byte *vector);