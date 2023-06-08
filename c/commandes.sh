


# Demande d'un fichier nomé 100M.iso dans le répertoire courant pour des tests
# Demande d'un fichier entree.bmp


make -B ecb_aes 
./ecb_aes encode 100M.iso 100code.ecb aaaaaaaaaaaaaaaa
./ecb_aes decode 100code.ecb 100decode.ecb aaaaaaaaaaaaaaaa
diff -s 100M.iso 100decode.ecb


make -B cbc_aes
./cbc_aes encode 100M.iso 100code.cbc aaaaaaaaaaaaaaaa
./cbc_aes decode 100code.cbc 100decode.cbc aaaaaaaaaaaaaaaa
diff -s 100M.iso 100decode.cbc

make bmp_aes -B
