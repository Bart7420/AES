{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use head" #-}


module AesFunctions where
import Polynome
import ZsurNZ
import Corps
import Anneau


-- ===============================
-- ========== CONSTANTES =========
-- ===============================


-- ==========   AES 128  =========
keyLength = 4
nbRound = 10
cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]) ]
matVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0])]

-- ==========   AES 192  =========
-- keyLength = 6
-- nbRound = 12
-- cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0])]

-- ==========   AES 256  =========
--keyLength = 8
--nbRound = 14
--cleVide = [Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0]), Z256Z (Poly [Z2Z 0])]



getEl :: Z_sur_256Z -> Int -> Z_sur_2Z
getEl (Z256Z (Poly tab)) x = tab!!x

concatZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
concatZ256Z (Z256Z (Poly a)) (Z256Z (Poly b)) = Z256Z (Poly (a ++ b))

scalProduct :: Polynome Z_sur_2Z -> Polynome Z_sur_2Z -> Z_sur_2Z
scalProduct (Poly []) (Poly []) = unitadd
scalProduct (Poly (x:xs)) (Poly (y:ys)) = operationadd (operationmul x y) (scalProduct (Poly xs) (Poly ys))


-- Fonction de conversion d'un tableau de polynomes de Z256Z
-- en une chaine affichée
-- la taille est le nombre d'éléments par ligne affichés
--              tab         taille
binToHex :: [Z_sur_256Z] -> Int -> IO()
binToHex l m = putStr ((binToHex_aux l 0 m) ++ "\n\n")

binToHex_aux :: [Z_sur_256Z] -> Int -> Int -> String
binToHex_aux [] _ _ = ""
binToHex_aux (x:xs) i m = (if (i `mod` m) == 0 then "\n " else "") ++ (convertToHex x) ++ " " ++ (binToHex_aux xs (i+1) m)

-- Foncfiotn de conversion d'UN polynome de Z256Z en chaine
-- qui représente le nombre en hexadécimal
--                 poly         doublet de caractere hexa
convertToHex :: Z_sur_256Z -> String
convertToHex (Z256Z (Poly p)) = [(convertToCara (take 4 (toGoodLengthZ256_4 p))), (convertToCara (drop 4 (toGoodLengthZ256_4 p)))]

convertToCara :: [Z_sur_2Z] -> Char
convertToCara c | ([Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0] == c) = '0'
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


-- Fonction de converison d'une string en chaine de poly de Z256Z
-- Valeurs en entrée 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
--    chaine de caractères hexa
--           |            tabeau de Z256Z en sortie
hexToBin :: String -> [Z_sur_256Z]
hexToBin [] = []
hexToBin [' '] = []
hexToBin (x:y:xs) | (x == ' ') = hexToBin (y:xs)
                         | otherwise = (convertCaraToBin (x:[y])) : (hexToBin xs)

convertCaraToBin :: String -> Z_sur_256Z
convertCaraToBin [x, y] = concatZ256Z (convertCaraToBin_aux x) (convertCaraToBin_aux y)

convertCaraToBin_aux :: Char -> Z_sur_256Z
convertCaraToBin_aux c | (c == '0') = Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0])
                       | (c == '1') = Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1])
                       | (c == '2') = Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0])
                       | (c == '3') = Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])
                       | (c == '4') = Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0])
                       | (c == '5') = Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1])
                       | (c == '6') = Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0])
                       | (c == '7') = Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1])
                       | (c == '8') = Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0])
                       | (c == '9') = Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1])
                       | (c == 'A') = Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0])
                       | (c == 'B') = Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1])
                       | (c == 'C') = Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0])
                       | (c == 'D') = Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1])
                       | (c == 'E') = Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0])
                       | (c == 'F') = Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])



-- calcule la transposee (echange les lignes et les colonnes de la pseudo matrice)
-- formée par les éléments de Z256Z
-- Int correspond à la longueur de la "matrice"
transpose :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
transpose matrice len = transpose_aux matrice len matVide

transpose_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z] -> [Z_sur_256Z]
transpose_aux matrice len output | (len == 4) = transpose_aux_4 matrice output 0
-- | (len == 6) = transpose_aux_6 matrice output 0


transpose_aux_4 :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
transpose_aux_4 _ output 4 = output
transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) output 0 = transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) (putColumn (output) (a:b:c:d:reste) 0) (1)
transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) output 1 = transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) (putColumn (output) (e:f:g:h:reste) 1) (2)
transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) output 2 = transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) (putColumn (output) (i:j:k:l:reste) 2) (3)
transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) output 3 = transpose_aux_4 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:reste) (putColumn (output) (m:n:o:p:reste) 3) (4)

--transpose_aux_6 :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
--transpose_aux_6 _ output 4 = output
--transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) output 0 = transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) (putColumn_key (output) (a:b:c:d:reste) 0) (1)
--transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) output 1 = transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) (putColumn_key (output) (e:f:g:h:reste) 1) (2)
--transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) output 2 = transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) (putColumn_key (output) (i:j:k:l:reste) 2) (3)
--transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) output 3 = transpose_aux_6 (a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:q:r:s:t:u:v:w:x:reste) (putColumn_key (output) (m:n:o:p:reste) 3) (4)

-- fonction utile de codage aes. Une chaine de longueur 32 est attendue
-- pour le texte (1ere) et une autre chaine pour la clé
-- Affiche le résultat du codage à l'utilisateur
cipher_aes :: String -> String -> IO()
cipher_aes text cle = binToHex (transpose (cipher (transpose (hexToBin text) 4) ( (transpose (hexToBin cle) 4))) 4) 30


-- fonction utile décodage AES. Une chaine de longueur 32 est attendue
-- pour le texte
-- affiche le message décodé à l'utilisateur
invcipher_aes :: String -> String -> IO()
invcipher_aes text cle = binToHex (transpose (invcipher (transpose (hexToBin text) 4) (transpose (hexToBin cle)4)) 4) 30


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

-- Fonction subBytes d'AES
-- Applique la transformation de la s-box à la state passée en paramètre
subBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
subBytes [] = []
subBytes (x:xs) = (toGoodLengthZ256 ((addMod256 (multMod256 (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])) (inverse256 x) ) (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]))))) : subBytes xs


-- ================================
-- ========= INV SUBBYTES =========
-- ================================

-- Fonction invsubBytes d'AES
-- Applique la transformation de la reverse-s-box à la state passée en paramètre
invsubBytes :: [Z_sur_256Z] -> [Z_sur_256Z]
invsubBytes [] = []
invsubBytes (x:xs)  | (x == unitadd) =  x : subBytes xs
                    | otherwise = (toGoodLengthZ256 (inverse256 (addMod256 (multMod256 (Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0])) (x) ) (Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1]))))) : invsubBytes xs



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
pickColumn_aux_key (x:xs) nb indice | (indice `mod` (4*(nbRound+1))) == nb = x : pickColumn_aux_key xs nb (indice+1)
                                | otherwise = pickColumn_aux_key xs nb (indice+1)


putColumn_key :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
putColumn_key liste column nb = putColumn_aux_key liste nb 0 column

putColumn_aux_key :: [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z] -> [Z_sur_256Z]
putColumn_aux_key x _ _ [] = x
putColumn_aux_key [] _ _ _ = []
putColumn_aux_key (x:xs) nb indice (y:ys) | (indice `mod` (4*(nbRound+1))) == nb = y : putColumn_aux_key xs nb (indice + 1) ys
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


-- Fonction principale de l'extension de clé en AES
-- La clé en entrée pet etre d'aes 128, 192, ou 256, selon les constantes choisies
extandKey :: [Z_sur_256Z] -> [Z_sur_256Z]
extandKey cle = extandKey_aux cle cleVide 0


extandKey_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
extandKey_aux base output j | (j == (4*(nbRound+1))) = output
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


-- Transormation linéaire de la fonction SubBytes
-- ici elle est appliquée sur un polynome de Z_256_Z
s :: (Z_sur_256Z) -> (Z_sur_256Z)
s x = (toGoodLengthZ256 ((addMod256 (multMod256 (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])) (inverse256 x) ) (Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1])))))

-- rcon élève le polynôme {02} (x) à la puissance x ou x est l'argument de la fonction
-- utilisé dans le calcul de l'extension de clé
rcon :: Int -> Z_sur_256Z
rcon x = Z256Z $ power (Poly [Z2Z 1, Z2Z 0]) x


-- élève le polynome a coeficients dans Z2Z à la puissance voulue
power :: Polynome Z_sur_2Z -> Int -> Polynome Z_sur_2Z
power _ 0 = (Poly [Z2Z 1])
power poly 1 = poly
power poly i = (multAES poly (power poly (i-1)))


-- ================================
-- ==========   CIPHER  ===========
-- ================================


-- Fonction principale d'encodage d'AES
-- entree / cle / sotie
cipher :: [Z_sur_256Z] -> [Z_sur_256Z] -> [Z_sur_256Z]
cipher entree cle = cipher_aux entree cle (-1)


cipher_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
cipher_aux entree cle round  | (round == -1) = cipher_aux entree (extandKey cle) 0
                          | (round == 0 ) = cipher_aux (addRoundKey entree (extract_round_key_from_key cle (0))) cle (round+1)
                          | (round == nbRound) = addRoundKey (shiftRows (subBytes entree))  (extract_round_key_from_key cle (4*nbRound))
                          | otherwise = cipher_aux (addRoundKey ( mixColumns (shiftRows (subBytes (entree))) ) ( extract_round_key_from_key cle (round*4) )  ) cle (round+1)


state_vide = [Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 0]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 1]),Z256Z (Poly [Z2Z 0])]


-- extrait la clé de tour de la clé étendue
-- les colonnes extraites sont les n, n+1, n+2, n+3
--
-- exemple : t = 1
-- 
--                                  valeurs retournées
--                                ||     ||     ||     ||
--                                \/     \/     \/     \/
-- ----------------------------------------------------------------------------------------------
-- | c0,0 | c0,1 | c0,2 | c0,3 | c0,4 | c0,5 | c0,6 | c0,7 | c0,8 | c0,9 | c0,10 | c0,11 | .... |
-- | c1,0 | c1,1 | c1,2 | c1,3 | c1,4 | c1,5 | c1,6 | c1,7 | c1,8 | c1,9 | c1,10 | c1,11 | .... |
-- | c2,0 | c2,1 | c2,2 | c2,3 | c2,4 | c2,5 | c2,6 | c2,7 | c2,8 | c2,9 | c2,10 | c2,11 | .... |
-- | c3,0 | c3,1 | c3,2 | c3,3 | c3,4 | c3,5 | c3,6 | c3,7 | c3,8 | c3,9 | c3,10 | c3,11 | .... |
-- ----------------------------------------------------------------------------------------------
extract_round_key_from_key :: [Z_sur_256Z] -> Int -> [Z_sur_256Z]
extract_round_key_from_key cle t = extract_round_key_from_key_aux cle t state_vide 0 0


extract_round_key_from_key_aux :: [Z_sur_256Z] -> Int -> [Z_sur_256Z] -> Int -> Int -> [Z_sur_256Z]
extract_round_key_from_key_aux cle t out col isortie | (col==t) || (col==t+1) || (col==t+2) || (col==t+3) = extract_round_key_from_key_aux cle t (putColumn (out) (pickColumn_key cle col) isortie) (col+1) (isortie+1)
                                                | (col == ((nbRound+1)*keyLength)) = out
                                                | otherwise =extract_round_key_from_key_aux cle t out (col+1) isortie



-- ================================
-- ========= INV CIPHER ===========
-- ================================

-- Fonction principale de décodage d'AES
-- entree / cle / sotie
invcipher :: [Z_sur_256Z] -> [Z_sur_256Z] -> [Z_sur_256Z]
invcipher entree cle = invcipher_aux entree cle (nbRound+1)

invcipher_aux :: [Z_sur_256Z] -> [Z_sur_256Z] -> Int -> [Z_sur_256Z]
invcipher_aux entree cle round  | (round == (nbRound+1)) = invcipher_aux entree (extandKey cle) (round-1)
                          | (round == (nbRound) ) = invcipher_aux (addRoundKey entree (extract_round_key_from_key cle (nbRound*4))) cle (round-1)
                          | (round == (0)) = addRoundKey (invsubBytes (invShiftRows entree))  (extract_round_key_from_key cle (0))
                          | otherwise = invcipher_aux (invMixColumns (addRoundKey (invsubBytes (invShiftRows (entree))) ( extract_round_key_from_key cle (round*4) ))) cle (round-1)




-- ================================
-- ======= VALEURS DE TEST ========
-- ================================



test_plaintext = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]), Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]), Z256Z (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]
test_cle = [Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]),Z256Z (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])]


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

