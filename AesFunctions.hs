

module AesFunctions where
import Polynome
import ZsurNZ
import Corps
import Anneau



getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))





--subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
--subBytes [] = []
--subBytes (x:xs) = (subBytes_aux (inverse256 (x)) (x) (7) ) : (subBytes xs)



--subBytes_aux :: Z_sur_256Z -> Z_sur_256Z -> Int ->Z_sur_256Z
--subBytes_aux (Z256Z (Poly [])) _ _= (Z256Z (Poly []))
--subBytes_aux (Z256Z (Poly(x:xs))) (Z256Z(Poly(y))) (i) =  concatZ256Z  (  Z256Z (Poly [( x `xor` ( ( getEl (Z256Z(Poly(y))) ( (i+4) `mod` (8)) ) `xor` ( ( getEl (Z256Z(Poly(y))) ((i+5) `mod` (8)) ) `xor` ( ( getEl ((Z256Z(Poly(y)))) ( (i+6) `mod` (8))) `xor` ( (getEl ((Z256Z(Poly(y)))) ((i+7) `mod` (8))) `xor` (getEl (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])) (i))) )) ) )])    )  (subBytes_aux (Z256Z (Poly(xs))) (Z256Z(Poly(y))) (i-1) )



subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
subBytes [] = []
subBytes (x:xs) = (subBytes_aux (inverse256 (x))) : (subBytes xs)

subBytes_aux :: Z_sur_256Z ->Z_sur_256Z
subBytes_aux (Z256Z (Poly [a,b,c,d,e,f,g,h])) = Z256Z (Poly [ab,bb,cb,db,eb,fb,gb,hb] )
                        where   ab =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [a,b,c,d,e,f,g,h]))) (unitmul)
                                bb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [a,b,c,d,e,f,g,h]))) (unitmul)
                                cb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]) ((Poly [a,b,c,d,e,f,g,h]))) (unitadd)
                                db =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]) ((Poly [a,b,c,d,e,f,g,h]))) (unitadd)
                                eb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]) ((Poly [a,b,c,d,e,f,g,h]))) (unitadd)
                                fb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]) ((Poly [a,b,c,d,e,f,g,h]))) (unitmul)
                                gb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]) ((Poly [a,b,c,d,e,f,g,h]))) (unitmul)
                                hb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [a,b,c,d,e,f,g,h]))) (unitadd)
