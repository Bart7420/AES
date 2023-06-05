typedef unsigned char byte;
void chiffrer_cbc();
void cipher_cbc(byte *extandedKey, byte *state, int nbRound);
void stateXor(byte *state, byte *xorwith);
void invcipher_cbc(byte *extandedKey, byte *state, int nbRound);