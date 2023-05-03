{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Redundant /=" #-}
{-# HLINT ignore "Use foldr" #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Polynome where

import Corps
import ZsurNZ
import Anneau

newtype Polynome a = Poly [a]    deriving (Eq, Show, Ord)


newtype Z_sur_256Z = Z256Z (Polynome Z_sur_2Z) deriving (Show, Eq, Ord)

addMod256 :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
addMod256 (Z256Z a) (Z256Z b) = Z256Z $ modPoly (addPoly a b) (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1])

oppose256 :: Z_sur_256Z -> Z_sur_256Z
oppose256 (Z256Z n) = Z256Z $ subPoly n (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])

multMod256 :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
multMod256 (Z256Z a) (Z256Z b) = Z256Z $ modPoly (multPoly a b) (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1])

inverse256 :: Z_sur_256Z -> Z_sur_256Z
inverse256 (Z256Z n) | (isPolynull n) = Z256Z $ (Poly [Z2Z 0])
                      | otherwise = Z256Z $ inverse n 

sub256 :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
sub256 (Z256Z x) (Z256Z y) = Z256Z $ modPoly (subPoly x y) (Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1])


instance Anneau Z_sur_256Z where
  unitadd = Z256Z (Poly [Z2Z 0])
  unitmul = Z256Z (Poly [Z2Z 1])
  inverseadd = oppose256
  operationadd = addMod256
  operationmul = multMod256
  operationsub = sub256

instance Corps Z_sur_256Z where
  inversemul = inverse256




instance Anneau a => Anneau (Polynome a) where
  unitadd = Poly [ unitadd ]
  unitmul = Poly [ unitmul ]
  -- inverseadd = oppose2
  operationadd = addPoly
  operationsub = subPoly
  -- inversemul = inverse2
  operationmul = multPoly

-- addPoly :: [Integer] -> [Integer] -> [Integer]
-- addPoly [] [] = []
--addPoly (x:xs) (y:ys) = (operationadd x y):(addPoly xs ys)

--subPoly :: [Integer] -> [Integer] -> [Integer]
--subPoly [] [] = []
--subPoly (x:xs) (y:ys) = (operationadd x (inverseadd y)):(addPoly xs ys)


--newtype Polynome = Poly [Z_sur_2Z]

--class Polynome a where
--    addP :: a -> a -> a
--    subP :: a -> a -> a
--    multP :: a -> a -> a
--    moduloP :: a -> a -> a


--instance Corps a => Polynome [a] where
--    addP = addPoly
--    subP = subPolyPos
--    multP = multPoly
--    moduloP = modPoly



-- L'idée ne serait-elle pas que les nombre de Z/6Z par exemple soit encodés en binaire par des polynomes de Z/2Z ?
-- Puis faire les meme opération mais au lieu d'ajouter des coefs de polynomes, on ajoute des polynomes "binaires"
-- Avant d'appliquer un modulo afin que les coefs restent dans Z/6Z : mod le polynome qui encode 6 donc [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0]
-- On aurait pour l'addition dans Z/6Z, par exemple si on ajoute 5X²+3X+2 à 2X²+5
-- [5, 3, 2] + [2, 0, 5]
-- Qui donnerait en binaire:
-- [[Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0], [Z2Z 1, Z2Z 1], [Z2Z 1, Z2Z 0]]     +     [[Z2Z 1, Z2Z 0], [Z2Z 0], [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]]
-- [7, 3, 7] = [[Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0], [Z2Z 1, Z2Z 1], [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0]]
-- On applique le modulo de Z/6Z c'est à dire P mod [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0] à chaque coef
-- On a donc [1, 3, 1]
-- = [[Z2Z 1], [Z2Z 1, Z2Z 1], [Z2Z 1]]


-----------------------------------------------------------------
-- Dans Z/nZ
-----------------------------------------------------------------

xor :: Z_sur_2Z -> Z_sur_2Z -> Z_sur_2Z
xor x y | x==y = Z2Z 0
        | otherwise = Z2Z 1

prepend :: Anneau a => a -> Polynome a -> Polynome a
prepend a (Poly l) = Poly (a:l)


-- Applique une operation entre deux listes (ex: + [1,2,3] [2,1,4] = [3,3,7])
-- ATTENTION LES LISTES DOIVENT ETRE DE LA MEME TAILLE
opWithAllElement :: Anneau a => (a -> a -> a) -> Polynome a -> Polynome a -> Polynome a
opWithAllElement f (Poly []) (Poly []) = Poly []
opWithAllElement f (Poly (x:xs)) (Poly (y:ys)) = prepend (f x y) (opWithAllElement f (Poly xs) (Poly ys))


-- ATTENTION (Poly [unitmul]) est un polynome de degré -1
degre :: Anneau a => Polynome a -> Int
degre (Poly []) = 0
degre (Poly (x:xs)) | (x == unitadd ) && (length xs == 0) = -1
                    | (x/=unitadd) = length xs
                    | otherwise = degre (Poly xs)


-- Addition des polynomes

--addPoly :: Corps a => Polynome a -> Polynome a -> Polynome a
--addPoly (Poly []) (Poly [])  = Poly []
--addPoly (Poly x) (Poly []) =  Poly x
--addPoly (Poly []) (Poly x)  = Poly x
--addPoly (Poly liste1) (Poly liste2) =  Poly (addListZnZ liste1 liste2)


opListZnZ :: Anneau a => (a -> a -> a) -> [a] -> [a] -> [a]
opListZnZ f [] [] = []
opListZnZ f (x:xs) (y:ys) = (f x y) : (opListZnZ f xs ys)


-- ================================
-- ============ ADD POLY ==========
-- ================================

addPoly :: Anneau a => Polynome a -> Polynome a -> Polynome a
addPoly (Poly []) p2 = p2
addPoly p1 (Poly []) = p1
addPoly (Poly p1@(x:xs)) (Poly p2@(y:ys))
  | (length p1 == length p2) = opWithAllElement operationadd (Poly p1) (Poly p2)
  | (length p1 > length p2) = Poly ( (take (length p1 - length p2) p1) ++ (opListZnZ operationadd (drop (length p1 - length p2) p1) p2) )
  | otherwise = Poly ( (take (length p2 - length p1) p2) ++ (opListZnZ operationadd p1 (drop (length p2 - length p1) p2)) )


addDegre :: Anneau a => Int -> [a] -> [a]
addDegre v l | (v < 1) = l
           | otherwise = addDegre (v-1) (l ++ [unitadd])


-- ================================
-- ========== MULT POLY ===========
-- ================================

multPoly :: Anneau a => Polynome a -> Polynome a -> Polynome a
multPoly _ (Poly []) = Poly []
multPoly (Poly []) _ = Poly []
multPoly (Poly (x:xs)) (Poly (y:ys)) = addPoly (Poly (addDegre (degre (Poly (x:xs))) (mult2 x (y:ys)))) (multPoly (Poly xs) (Poly (y:ys)))

mult2 :: Anneau a => a -> [a] -> [a]
mult2 x ys = map (operationmul x) ys

multAESZ256Z :: Z_sur_256Z -> Z_sur_256Z -> Z_sur_256Z
multAESZ256Z (Z256Z a) (Z256Z b) = Z256Z $ modPoly (multPoly a b) (Poly [unitmul, unitadd, unitadd, unitadd, unitmul, unitmul, unitadd, unitmul, unitmul])


isPolynull :: Anneau a => Polynome a -> Bool
isPolynull (Poly []) = True
isPolynull (Poly (x:xs))   | x == unitadd = isPolynull (Poly xs)
                           | otherwise = False


-- Enlève les coefs de degrés supérieurs nuls : [0,0,1,0,1,0] -> [1,0,1,0]
removeZeros :: Anneau a => Polynome a -> Polynome a
removeZeros (Poly []) = Poly [unitadd]
removeZeros (Poly (x:xs)) | x == unitadd = removeZeros (Poly xs)
                          | otherwise = Poly (x:xs)



removeZerosZ256 :: Z_sur_256Z -> Z_sur_256Z
removeZerosZ256 (Z256Z (Poly [])) =  (Z256Z (Poly []))
removeZerosZ256 (Z256Z (Poly (x:xs))) | (x == unitadd) = removeZerosZ256 (Z256Z (Poly (xs)))
                                  | otherwise = (Z256Z (Poly (x:xs)))


completeZerosZ256 :: Z_sur_256Z -> Int -> Z_sur_256Z
completeZerosZ256 (Z256Z (Poly a)) v  | (length a) == v = Z256Z (Poly a)
                          | ((length a) < v) = completeZerosZ256 (Z256Z(Poly (unitadd:a))) v
                          | otherwise = Z256Z (Poly a) -- cas si le polynôme est deja trop grand

toGoodLengthZ256 :: Z_sur_256Z -> Z_sur_256Z
toGoodLengthZ256 (Z256Z (Poly a)) | (length a) > 8 = removeZerosZ256 (Z256Z (Poly a))
                                  | (length a ) < 8 = completeZerosZ256 (Z256Z (Poly a)) 8
                                  | otherwise = (Z256Z (Poly a))

toGoodLengthZ256_4 :: [Z_sur_2Z] -> [Z_sur_2Z]
toGoodLengthZ256_4 a | (length a) > 8 = extractPoly (removeZerosZ256 (Z256Z (Poly a)))
                    | (length a ) < 8 = extractPoly (completeZerosZ256 (Z256Z (Poly a)) 8)
                    | otherwise = a

extractPoly :: Z_sur_256Z -> [Z_sur_2Z]
extractPoly (Z256Z (Poly a)) = a



-- Crée un polynome nul de "degré" x : [0,0,0,0,0] avec x=4
createPolyNul :: Anneau a => Int -> Polynome a
createPolyNul 0 = Poly [unitadd]
createPolyNul x = prepend unitadd (createPolyNul (x-1))


-- Crée un polynome de la forme X^x : [1,0,0,...]
-- Si x = 0, [Z2Z 1] est retourné
createPoly :: Anneau a => Int -> Polynome a
createPoly x | (x>0) = prepend unitmul (createPolyNul (x-1))
              | otherwise = Poly [unitmul]


-- Vérifie si le polynome n'a pas de coef négatifs
validPoly :: Anneau a => Polynome a -> Bool
validPoly (Poly []) = True
validPoly (Poly (x:xs)) = (x >= unitadd) && validPoly (Poly xs)


-- Soustraction de deux polynomes dans un anneau Z/2Z qui crée des coefs négatifs
-- Si les polynomes sont de meme degré, on soustrait les coefs un a un, sinon on tronque celui de degré supérieur
subPolyNeg :: (Anneau a) => Polynome a -> Polynome a -> Polynome a
subPolyNeg (Poly []) p2 = p2
subPolyNeg p1 (Poly []) = p1
subPolyNeg (Poly p1@(x:xs)) (Poly p2@(y:ys))
  | (length p1 == length p2) = opWithAllElement (operationsub) (Poly p1) (Poly p2)
  | (length p1 > length p2) = Poly ( (take (length p1 - length p2) p1) ++ (opListZnZ (operationsub) (drop (length p1 - length p2) p1) p2) )
  | otherwise = Poly ( (take (length p2 - length p1) p2) ++ (opListZnZ (operationsub) p1 (drop (length p2 - length p1) p2)) )

subPoly :: (Anneau a) => Polynome a -> Polynome a -> Polynome a
subPoly a b = Poly (removeNeg (subPolyNeg a b))
              where removeNeg (Poly (x:xs)) | (x < unitadd) = (inverseadd x):removeNeg (Poly xs)
                                            | otherwise = x:removeNeg (Poly xs)
                    removeNeg (Poly []) = []


-- Forme : <p1> [p2]
-- Idée : on enlève le polynome 2 autant de fois que l'on peut au polynome 1
-- Si il est de degré inférieur on le ramène au degré du polynome a moduloter en le multipliant par X^a
-- Puis on recommence en faisant décroite X^a de degré en degré jusqu'a son degré initial
-- Pour vérifier qu'on peut soustraire le polynome 2 on regarde si la fonction subPolyPos ne retourne pas de coefs négatifs avec la fonction validPoly
-- modPoly :: (Anneau a, Num a) => Polynome a -> Polynome a -> Polynome a
--modPoly (Poly []) (Poly []) = Poly [unitadd]
--modPoly pol1 pol2 = f ((degre pol1)-(degre pol2)) pol1 pol2
--                  where f :: (Anneau a, Num a) => Int -> Polynome a -> Polynome a -> Polynome a
--                        f v p1 p2 
--                            | (v>=0) = if(validPoly (subPolyNeg p1 mulX)) then (f v (subPolyNeg p1 mulX) p2) else (f (v-1) p1 p2)         
--                            | otherwise = p1
--                                where mulX = (multPoly (createPoly v) p2)



-- ================================
-- =========== MOD POLY ===========
-- ================================

modPoly :: (Anneau a) => Polynome a -> Polynome a -> Polynome a
modPoly a b = snd (divPoly_aux unitadd a b a)

poly1 = Poly [Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]
poly2 = Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1]

poly3 = Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0]
poly4 = Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0]


a = Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]
b = Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]
c = Poly [Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]
d = Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0]

pa = Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]

poly_irr = Poly [Z2Z 1, Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]



-- Multiplication d'AES avec la réduction modulo le polynome irréductible
multAES :: (Anneau a) => Polynome a -> Polynome a -> Polynome a
multAES pol1 pol2 = (modPoly (multPoly pol1 pol2) polyIrr)
        where polyIrr = Poly [unitmul, unitadd, unitadd, unitadd, unitmul, unitmul, unitadd, unitmul, unitmul]


-- division de Polynomes 
divPoly :: (Anneau a) => Polynome a -> Polynome a -> Polynome a
-- divPoly pol1 unitmul = pol1
divPoly pol1 pol2 | (pol2 /= unitadd) = (fst (divPoly_aux unitadd (pol1) (pol2) (pol1)))
                  | otherwise = (unitmul)

divPoly_aux :: (Anneau a) => Polynome a -> Polynome a -> Polynome a -> Polynome a -> (Polynome a, Polynome a)
divPoly_aux q r b a | (degre r) >= (degre b) = divPoly_aux (removeZeros (operationadd (q) (createPoly ((degre r) -(degre b))))) (operationsub (r) ( removeZeros (operationmul b (createPoly ((degre r) -(degre b))) ))) b a
                    | otherwise = (q, r)




--euclide :: (Anneau a, Num a) => Polynome a -> Polynome a -> (Polynome a, Polynome a, Polynome a)
--euclide a b | ((removeZeros b)==unitmul) =(a, unitadd, unitmul)
--            | otherwise = (x, z, (subPoly (y) (multPoly (divPoly a b) (z) ) ))
--                  where (x,y,z) = euclide b (modPoly a b)


-- ================================
-- ============ INVERSE ===========
-- ================================
 
inverse :: (Anneau a) => Polynome a -> Polynome a
inverse pol = modPoly c (polyIrr)
      where polyIrr = Poly [unitmul, unitadd, unitadd, unitadd, unitmul, unitmul, unitadd, unitmul, unitmul]
            (a, b, c) = euclide (pol) (polyIrr)




-- Théorème d'euclide étendu aux polynomes
euclide2 :: (Anneau a) => Polynome a -> Polynome a -> Polynome a -> Polynome a -> Polynome a -> Polynome a -> (Polynome a , Polynome a , Polynome a)
euclide2 r u v r2 u2 v2 | ((removeZeros r2) == (Poly [unitadd]))= (r, u, v)
                        | otherwise =  euclide2 r2 u2 v2 (removeZeros (subPoly r (multPoly (divPoly r r2) (r2) )))  ((subPoly u (multPoly (divPoly r r2) (u2) )))  ((subPoly v (multPoly (divPoly r r2) (v2) )))

euclide :: (Anneau a) => Polynome a -> Polynome a -> (Polynome a , Polynome a , Polynome a)
euclide a b = euclide2 a (unitadd) unitmul b unitmul unitadd


