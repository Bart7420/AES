

module AesFunctions where
import Polynome
import ZsurNZ


getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))





