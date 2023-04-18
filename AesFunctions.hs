

module AesFunctions where
import Polynome
import ZsurNZ


getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x


