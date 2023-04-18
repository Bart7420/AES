{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}


module AesFunctions where
import Polynome
import ZsurNZ
import Data.Bits (Bits(rotate))



getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))


shiftRows :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows (x:y:xs) = shiftRows_aux (y:xs)


shiftRows_aux :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows_aux ((Z256Z (Poly tab)):xs) = (Z256Z (Poly (rotateLeft (rotateLeft (rotateLeft tab))))):(shiftRows_aux xs)

rotateLeft :: [Z_sur_2Z] -> [Z_sur_2Z]
rotateLeft tab = [(tab!!6), (tab!!5), (tab!!4), (tab!!3), (tab!!2), (tab!!1), (tab!!0), (tab!!7)]



subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
subBytes (x:xs) = subBytes_aux (inversePoly (x)) (x) (7)



subBytes_aux :: Z_sur_256Z -> Z_sur_256Z -> Int ->Z_sur_256Z
subBytes_aux (Z256Z (Poly [])) _ _= (Z256Z (Poly []))
subBytes_aux (Z256Z (Poly(x:xs))) (Z256Z(Poly(y))) (i) = ( x (xor) ( ( getEl (Z256Z (Poly (y))) ( (i+4) mod (8)) ) (xor) ( ( getEl (Z256Z (Poly (y))) ((i+5) mod (8)) ) (xor) ( ( getEl ((Z256Z (Poly (y)))) ( (i+6) mod (8))) (xor) ( (getEl ((Z256Z (Poly (y)))) ((i+7) mod (8))) (xor) (getEl (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])) (i))) )) ) ) : subBytes_aux (xs)