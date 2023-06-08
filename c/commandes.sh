


# Demande d'un fichier nomé 100M.iso dans le répertoire courant pour des tests


make -B ecb_aes
./ecb_aes encode 100M.iso 100code.ecb aaaaaaaaaaaaaaaa
./ecb_aes decode 100code.ecb 100decode.ecb aaaaaaaaaaaaaaaa
diff -s 100M.iso 100decode.ecb


make -B cbc_aes
./cbc_aes encode 100M.iso 100code.cbc aaaaaaaaaaaaaaaa
./cbc_aes decode 100code.cbc 100decode.cbc aaaaaaaaaaaaaaaa
diff -s 100M.iso 100decode.cbc