


addPoly (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1])
-- Poly [Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 0]
addPoly (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 0, Z2Z 0])
-- Poly [Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1]
addPoly (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0])
-- Poly [Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1]
addPoly (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0])
-- Poly [Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1]
degre (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1])
-- 2
degre (Poly [Z2Z 1, Z2Z 1, Z2Z 1, Z2Z 1])
-- 3
degre (Poly [Z2Z 1, Z2Z 1, Z2Z 0, Z2Z 0])
-- 3
degre (Poly [Z2Z 0, Z2Z 0, Z2Z 0, Z2Z 1])
-- 0
multPoly (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0])
-- Poly [Z2Z 1,Z2Z 1,Z2Z 1,Z2Z 0]
multPoly (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1])
-- Poly [Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 1]
multPoly (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0])
-- Poly [Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0]
multPoly (Poly poly1)  (Poly poly_irr)
-- Poly [Z2Z 1,Z2Z 1,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 0,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 1]


modPoly (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0])
-- Poly [Z2Z 1]
modPoly (Poly [Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1])
-- Poly [Z2Z 1,Z2Z 0]
modPoly (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1]) (Poly [Z2Z 1, Z2Z 0, Z2Z 1, Z2Z 1, Z2Z 0])
-- Poly [Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 1]
modPoly (Poly poly1)  (Poly poly_irr)
-- Poly [Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 0,Z2Z 1,Z2Z 1,Z2Z 1]


-- test de modification lol