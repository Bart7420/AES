{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}


module AesFunctions where
import Polynome
import ZsurNZ
import Corps
import Anneau

-- AES 128
--keyLength = 4
--nbRound = 10
--cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]) ]

-- AES 192
keyLength = 6
nbRound = 12
cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]) ]

-- AES 256
--keyLength = 8
--nbRound = 14
--cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]) ]


getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))

scalProduct :: Polynome Z_sur_2Z -> Polynome Z_sur_2Z -> Z_sur_2Z
scalProduct (Poly []) (Poly []) = unitadd
scalProduct (Poly (x:xs)) (Poly (y:ys)) = operationadd (operationmul x y) (scalProduct (Poly xs) (Poly ys))

binToHex :: [Z_sur_256Z] -> [String]
binToHex [] = [""]
binToHex (x:xs) = (convertToHex x):(binToHex xs)

convertToHex :: Z_sur_256Z -> String
convertToHex (Z256Z (Poly p)) = [(convertCara (take 4 (toGoodLengthZ256_4 p))), (convertCara (drop 4 (toGoodLengthZ256_4 p)))]

convertCara :: [Z_sur_2Z] -> Char
convertCara c | ([Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0] == c) = '0'
              | ([Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1] == c) = '1'
              | ([Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0] == c) = '2'
              | ([Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1] == c) = '3'
              | ([Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0] == c) = '4'
              | ([Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1] == c) = '5'
              | ([Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0] == c) = '6'
              | ([Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1] == c) = '7'
              | ([Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0] == c) = '8'
              | ([Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1] == c) = '9'
              | ([Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0] == c) = 'A'
              | ([Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1] == c) = 'B'
              | ([Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0] == c) = 'C'
              | ([Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1] == c) = 'D'
              | ([Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0] == c) = 'E'
              | ([Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1] == c) = 'F'
              | otherwise = '+'

-- ===============================
-- ========== SHIFTROWS ==========
-- ===============================

shiftRows :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows liste = a ++ shiftRows_aux b
                  where (a, b) = splitAt 4 liste

shiftRows_aux :: [Z_sur_256Z] -> [Z_sur_256Z]
shiftRows_aux [] = []
shiftRows_aux tab = (rotateLeft tab)

rotateLeft :: [Z_sur_256Z] -> [Z_sur_256Z]
rotateLeft tab = [(tab!!1), (tab!!2), (tab!!3), (tab!!0), (tab!!6), (tab!!7), (tab!!4), (tab!!5), (tab!!11), (tab!!8), (tab!!9), (tab!!10)]


shiftrow_in = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),
              Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),

              Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),

              Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),

              Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]),
              Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0])]


-- ===============================
-- ======== INV SHIFTROWS ========
-- ===============================

invShiftRows :: [Z_sur_256Z] -> [Z_sur_256Z]
invShiftRows liste = a ++ invShiftRows_aux b
                  where (a, b) = splitAt 4 liste

invShiftRows_aux :: [Z_sur_256Z] -> [Z_sur_256Z]
invShiftRows_aux [] = []
invShiftRows_aux tab = (rotateRight tab)

rotateRight :: [Z_sur_256Z] -> [Z_sur_256Z]
rotateRight tab = [(tab!!3), (tab!!0), (tab!!1), (tab!!2), (tab!!6), (tab!!7), (tab!!4), (tab!!5), (tab!!9), (tab!!10), (tab!!11), (tab!!8)]


-- ================================
-- ========== MIXCOLUMNS ==========
-- ================================

mixColumns :: [Z_sur_256Z] -> [Z_sur_256Z]
mixColumns state = mixColumns_aux state 0

mixColumns_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
mixColumns_aux state i | i < 4 = mixColumns_aux (putColumn state (mixOpColumn (pickColumn state i)) i) (i+1)
                       | otherwise = state

mixOpColumn :: [Z_sur_256Z] -> [Z_sur_256Z]
mixOpColumn [a, b, c, d] = [firstel, sndel, thirdel, fourthel]
                          where firstel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0])) a), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1])) b), c, d])
                                sndel = (foldr operationadd unitadd [a, removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0])) b), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1])) c), d])
                                thirdel = (foldr operationadd unitadd [a, b, removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0])) c), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1])) d)])
                                fourthel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1])) a), b, c, removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0])) d)])

-- ================================
-- ======== INV MIXCOLUMNS ========
-- ================================
invMixColumns :: [Z_sur_256Z] -> [Z_sur_256Z]
invMixColumns state = invMixColumns_aux state 0

invMixColumns_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
invMixColumns_aux state i | i < 4 = invMixColumns_aux (putColumn state (invMixOpColumn (pickColumn state i)) i) (i+1)
                       | otherwise = state

invMixOpColumn :: [Z_sur_256Z] -> [Z_sur_256Z]
invMixOpColumn [a, b, c, d] = [firstel, sndel, thirdel, fourthel]
                          where firstel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0])) a), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])) b), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1])) c), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1])) d)])
                                sndel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1])) a), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0])) b), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])) c), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1])) d)])
                                thirdel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1])) a), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1])) b), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0])) c), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])) d)])
                                fourthel = (foldr operationadd unitadd [removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])) a), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1])) b), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1])) c), removeZerosZ256 (multAESZ256Z (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0])) d)])


-- Ne marche pas car modPoly est une boucle infinie avec des poly à coef dans Z256Z (à cause de divPoly_aux, du à la manière dont les opération + et - sont faites sur les coefs)

--mixColumns_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
--mixColumns_aux state i | i < 4 = putColumn state (polyToList (result state (i+1))) (i+1)
--                       | otherwise = state

--result :: [Z_sur_256Z] -> Int -> Polynome Z_sur_256Z
--result state i = modPoly (operationmul (Poly (pickColumn state i)) (Poly [Z256Z (Poly [Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1]), Z256Z (Poly [Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0])])) (Poly [Z256Z (Poly [Z2Z 1]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 1])])

--polyToList :: Polynome Z_sur_256Z -> [Z_sur_256Z]
--polyToList (Poly liste) = liste





--subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
--subBytes [] = []
--subBytes (x:xs) = (subBytes_aux (inverse256 (x)) (x) (7) ) : (subBytes xs)



--subBytes_aux :: Z_sur_256Z -> Z_sur_256Z -> Int ->Z_sur_256Z
--subBytes_aux (Z256Z (Poly [])) _ _= (Z256Z (Poly []))
--subBytes_aux (Z256Z (Poly(x:xs))) (Z256Z(Poly(y))) (i) =  concatZ256Z  (  Z256Z (Poly [( x `xor` ( ( getEl (Z256Z(Poly(y))) ( (i+4) `mod` (8)) ) `xor` ( ( getEl (Z256Z(Poly(y))) ((i+5) `mod` (8)) ) `xor` ( ( getEl ((Z256Z(Poly(y)))) ( (i+6) `mod` (8))) `xor` ( (getEl ((Z256Z(Poly(y)))) ((i+7) `mod` (8))) `xor` (getEl (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])) (i))) )) ) )])    )  (subBytes_aux (Z256Z (Poly(xs))) (Z256Z(Poly(y))) (i-1) )



-- subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
--subBytes [] = []
--subBytes (x:xs) = (subBytes_aux (completeZerosZ256 (inverse256 (x)) 8 )) : (subBytes xs)

--subBytes_aux :: Z_sur_256Z ->Z_sur_256Z
--subBytes_aux (Z256Z (Poly [a,b,c,d,e,f,g,h])) = Z256Z (Poly [hb,gb,fb,eb,db,cb,bb,ab] )
--                        where   ab =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
  --                              bb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
    --                            cb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
      --                          db =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
        --                        eb =  operationadd ( scalProduct (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)
          --                      fb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
            --                    gb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]) ((Poly [h,g,f,e,d,c,b,a]))) (unitmul)
              --                  hb =  operationadd ( scalProduct (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]) ((Poly [h,g,f,e,d,c,b,a]))) (unitadd)


-- ================================
-- =========== SUBBYTES ===========
-- ================================

subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
subBytes [] = []
subBytes (x:xs) = (toGoodLengthZ256 ((addMod256 (multMod256 (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])) (inverse256 x) ) (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]))))) : subBytes xs


-- ================================
-- ========= INV SUBBYTES =========
-- ================================

invsubBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
invsubBytes [] = []
invsubBytes (x:xs) = (toGoodLengthZ256 (inverse256 (addMod256 (multMod256 (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0])) (x) ) (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1]))))) : subBytes xs





pickColumn :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
pickColumn liste nb = pickColumn_aux liste nb 0

pickColumn_aux :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
pickColumn_aux [] _ _ = []
pickColumn_aux (x:xs) nb indice | (indice `mod` 4) == nb = x : pickColumn_aux xs nb (indice+1)
                                | otherwise = pickColumn_aux xs nb (indice+1)


putColumn :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
putColumn liste column nb = putColumn_aux liste nb 0 column

putColumn_aux :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z] -> [Z_sur_256Z]
putColumn_aux x _ _ [] = x
putColumn_aux [] _ _ _ = []
putColumn_aux (x:xs) nb indice (y:ys) | (indice `mod` 4) == nb = y : putColumn_aux xs nb (indice + 1) ys
                                        | otherwise = x : putColumn_aux xs nb (indice + 1) (y:ys)


pickColumn_key :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
pickColumn_key liste nb = pickColumn_aux_key liste nb 0

pickColumn_aux_key :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
pickColumn_aux_key [] _ _ = []
pickColumn_aux_key (x:xs) nb indice | (indice `mod` (nbRound*keyLength + keyLength)) == nb = x : pickColumn_aux_key xs nb (indice+1)
                                | otherwise = pickColumn_aux_key xs nb (indice+1)


putColumn_key :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
putColumn_key liste column nb = putColumn_aux_key liste nb 0 column

putColumn_aux_key :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z] -> [Z_sur_256Z]
putColumn_aux_key x _ _ [] = x
putColumn_aux_key [] _ _ _ = []
putColumn_aux_key (x:xs) nb indice (y:ys) | (indice `mod` (nbRound*keyLength + keyLength)) == nb = y : putColumn_aux_key xs nb (indice + 1) ys
                                        | otherwise = x : putColumn_aux_key xs nb (indice + 1) (y:ys)



-- ================================
-- ========== ADDROUNDKEY =========
-- ================================

addRoundKey :: [Z_sur_256Z] -> [Z_sur_256Z] -> [Z_sur_256Z]
addRoundKey state key = addRoundKey_aux state key 0

addRoundKey_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
addRoundKey_aux state _ 4 = state
addRoundKey_aux state key col = addRoundKey_aux (putColumn state ( addLists (pickColumn state col) (pickColumn key col) ) col ) key (col+1)



addLists :: Anneau a => [a] -> [a] -> [a]
addLists x y = map add $ zip x y
        where add (x, y) = operationadd x y


texte = [Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0])]
cle = [Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])]


cle_base = [Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])]



-- ================================
-- ========== EXTANDKEY ===========
-- ================================

extandKey :: [Z_sur_256Z] -> [Z_sur_256Z]
extandKey cle = extandKey_aux cle cleVide 0


extandKey_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
extandKey_aux base output j | (j == (keyLength*(nbRound+1))) = output
                            | (j < keyLength) = extandKey_aux base (putColumn_key output (pickColumn base j) j) (j+1)
                            | ((j `mod` keyLength) == 0) = extandKey_aux base (putColumn_key output (op_spe output j 0) j) (j+1)
                            | (((j `mod` keyLength) == 4) && (keyLength == 8)) = extandKey_aux base (putColumn_key output (op_normal_with_s output j 0) j) (j+1)
                            | otherwise = extandKey_aux base (putColumn_key output (op_normal output j 0) j) (j+1)


op_normal :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
op_normal _ _ 4 = []
op_normal output colonne ligne = ( (operationadd) ( (!!) (pickColumn_key output (colonne - keyLength))  ligne) ( (!!) (pickColumn_key output (colonne -1)) ligne ) ) : (op_normal output colonne (ligne+1))


op_normal_with_s :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
op_normal_with_s _ _ 4 = []
op_normal_with_s output colonne ligne = ( (operationadd) ( (!!) (pickColumn_key output (colonne - keyLength))  ligne) (s ( (!!) (pickColumn_key output (colonne -1)) ligne ) )) : (op_normal output colonne (ligne+1))


op_spe :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
op_spe _ _ 4 = []
op_spe output colonne ligne | (ligne == 0) = ( (operationadd) ( (operationadd) ( (!!) (pickColumn_key output (colonne-keyLength)) 0) ( (s) ( (!!) (pickColumn_key output (colonne-1)) 1)) ) ( rcon ((colonne `div` keyLength) -1) ) ) : op_spe output colonne (ligne+1)
                            | otherwise = ( (operationadd) ((!!) (pickColumn_key output (colonne-keyLength)) ligne) ((s) ((!!) (pickColumn_key output (colonne-1)) ((ligne+1) `mod` 4)))) : (op_spe output colonne (ligne+1))



s :: (Z_sur_256Z) -> (Z_sur_256Z)
s x = (toGoodLengthZ256 ((addMod256 (multMod256 (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])) (inverse256 x) ) (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])))))

rcon :: Int -> Z_sur_256Z
rcon x = Z256Z $ power (Poly [Z2Z 1, Z2Z 0]) x



power :: Polynome Z_sur_2Z -> Int -> Polynome Z_sur_2Z
power _ 0 = (Poly [Z2Z 1])
power poly 1 = poly
power poly i = (multAES poly (power poly (i-1)))



test = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]) ]



test_with_kes = [Z256Z (Poly [Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 1]),Z256Z (Poly [Z2Z 1,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 0]),Z256Z (Poly [Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1]),Z256Z (Poly [Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0]),Z256Z (Poly [Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0]),Z256Z (Poly [Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0]),Z256Z (Poly [Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0])]


cle_192 = [Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),

            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),
            Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),

            Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),

            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),
            Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),
            Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])]



-- entree / cle / sotie
cipher :: [Z_sur_256Z] -> [Z_sur_256Z] -> [Z_sur_256Z]
cipher entree cle = cipher_aux entree cle (-1)


cipher_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
cipher_aux entree cle round  | (round == -1) = cipher_aux entree (extandKey cle) 0
                          | (round == 0 ) = cipher_aux (addRoundKey entree (extract_key_from_key cle (0))) cle (round+1)
                          | (round == nbRound) = addRoundKey (shiftRows(subBytes cle))  (extract_key_from_key cle (4*nbRound)) 
                          | otherwise = cipher_aux (addRoundKey ( mixColumns(shiftRows(subBytes(entree))) ) ( extract_key_from_key cle (round*4) )  ) cle (round+1)
  

state_vide = [Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0])]


extract_key_from_key :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
extract_key_from_key cle t = extract_key_from_key_aux cle t state_vide 0 0
  

extract_key_from_key_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]  
extract_key_from_key_aux cle t out col isortie | (col==t) || (col==t+1) || (col==t+2) || (col==t+3) = extract_key_from_key_aux cle t (putColumn (out) (pickColumn_key cle col) isortie) (col+1) (isortie+1)
                                                | (col == ((nbRound+1)*keyLength)) = out
                                                | otherwise =extract_key_from_key_aux cle t out (col+1) isortie



-- entree / cle / sotie
invcipher :: [Z_sur_256Z] -> [Z_sur_256Z] -> [Z_sur_256Z]
invcipher entree cle = invcipher_aux entree cle (nbRound)

invcipher_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
invcipher_aux entree cle round  | (round == nbRound) = invcipher_aux entree (extandKey cle) (round-1)
                          | (round == (nbRound-1) ) = invcipher_aux (addRoundKey entree (extract_key_from_key cle (nbRound*4))) cle (round-1)
                          | (round == (-1)) = addRoundKey (invsubBytes(invShiftRows cle))  (extract_key_from_key cle (0)) 
                          | otherwise = invcipher_aux (invMixColumns(addRoundKey (invsubBytes(invShiftRows(entree))) ( extract_key_from_key cle (round*4) ))) cle (round-1)
  

-- (addRoundKey ( mixColumns(shiftRows(subBytes(entree))) ) ( extract_key_from_key cle (round*4) )  )




test_plaintext = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]
test_cipher = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]

-- (addRoundKey ( mixColumns(shiftRows(subBytes(entree))) ) ( extract_key_from_key cle (round*4) )  )




test_plaintext = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]
test_cipher = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]
