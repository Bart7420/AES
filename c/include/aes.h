typedef unsigned char byte;
void subBytes(byte *state);
void invSubBytes(byte *state);
void addRoundKey(byte *state, byte *key);
void shiftRows(byte *state);
void invShiftRows(byte *state);
void mixColumn(byte *state);
void invMixColumn(byte *state);
void xor(byte word1[4], byte word2[4], byte result[4])
byte multPoly(byte poly1, byte poly2);
byte *keyExpansion(byte *key, int keyLength, int nbRound);
byte *chiffrer(byte *key, byte *input, int keyLength);
byte *dechiffrer(byte *key, byte *input, int keyLength);