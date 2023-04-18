{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}


module AesFunctions where
import Polynome
import ZsurNZ
import Corps
import Anneau



getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))

scalProduct :: Polynome Z_sur_2Z -> Polynome Z_sur_2Z -> Z_sur_2Z
scalProduct (Poly []) (Poly []) = unitadd
scalProduct (Poly (x:xs)) (Poly (y:ys)) = operationadd (operationmul x y) (scalProduct (Poly xs) (Poly ys))


shiftRows :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows (x:y:xs) = x:shiftRows_aux (y:xs)
shiftRows (x:xs) = x:shiftRows_aux (xs)


shiftRows_aux :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows_aux [] = []
shiftRows_aux ((Z256Z (Poly tab)):xs) = (Z256Z (Poly (rotateLeft (rotateLeft (rotateLeft tab))))):(shiftRows_aux xs)

rotateLeft :: [Z_sur_2Z] -> [Z_sur_2Z]
rotateLeft tab = [(tab!!6), (tab!!5), (tab!!4), (tab!!3), (tab!!2), (tab!!1), (tab!!0), (tab!!7)]




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
subBytes_aux (Z256Z (Poly [a,b,c,d,e,f,g,h])) = Z256Z (Poly [hb,gb,fb,eb,db,cb,bb,ab] )
                        where   ab =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
                                bb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
                                cb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
                                db =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
                                eb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
                                fb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
                                gb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
                                hb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
