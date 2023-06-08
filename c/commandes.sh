


# Demande d'un fichier nomé 100M.iso dans le répertoire courant pour des tests
# Demande d'un fichier entree.bmp

make -B main test=1
./main


make -B ecb_aes 
./ecb_aes encode 100M.iso 100code.ecb 000102030405060708090a0b0c0d0e0f
./ecb_aes decode 100code.ecb 100decode.ecb 000102030405060708090a0b0c0d0e0f
diff -s 100M.iso 100decode.ecb


make -B cbc_aes
./cbc_aes encode 100M.iso 100code.cbc 000102030405060708090a0b0c0d0e0f
./cbc_aes decode 100code.cbc 100decode.cbc 000102030405060708090a0b0c0d0e0f
diff -s 100M.iso 100decode.cbc

make bmp_aes -B
./bmp_aes encode ecb entree.bmp bmpcode.ecb 000102030405060708090a0b0c0d0e0f
./bmp_aes decode ecb bmpcode.ecb bmpdecode.ecb 000102030405060708090a0b0c0d0e0f
diff -s entree.bmp bmpdecode.ecb


./bmp_aes encode cbc entree.bmp bmpcode.cbc 000102030405060708090a0b0c0d0e0f
./bmp_aes decode cbc bmpcode.cbc bmpdecode.cbc 000102030405060708090a0b0c0d0e0f
diff -s entree.bmp bmpdecode.cbc

