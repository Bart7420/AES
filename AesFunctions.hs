

module AesFunctions where
import Polynome
import ZsurNZ


subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
subBytes (x:xs) = subBytes_aux (inversePoly (x)) (x) (7)


subBytes_aux :: Z_sur_256Z -> Z_sur_256Z -> Int ->Z_sur_256Z
subBytes_aux (Z256Z (Poly [])) _ _= (Z256Z (Poly []))
subBytes_aux (Z256Z (Poly(x:xs))) (Z256Z(Poly(y))) (i) = ( x (xor) ( ( getEl (Z256Z(Poly(y))) ( (i+4) mod (8)) ) (xor) ( ( getEl (Z256Z(Poly(y))) ((i+5) mod (8)) ) (xor) ( ( getEl ((Z256Z(Poly(y)))) ( (i+6) mod (8))) (xor) ( (getEl ((Z256Z(Poly(y)))) ((i+7) mod (8))) (xor) (getEl (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])) (i))) )) ) ) : subBytes_aux (xs)