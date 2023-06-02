void subBytes(unsigned char *state);
void invSubBytes(unsigned char *state);
void addRoundKey(unsigned char *state, unsigned char *key);
void shiftRows(unsigned char *state);
void invShiftRows(unsigned char *state);
void mixColumn(unsigned char *state);
void invMixColumn(unsigned char *state);
unsigned char multPoly(unsigned char poly1, unsigned char poly2);