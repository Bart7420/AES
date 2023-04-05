module Group where

-- Définition de la classe Group

class Group a where
  unit :: a
  inverse :: a -> a
  operation :: a -> a -> a






-- Les entiers munis de l'addition forment un groupe
instance Group Integer where
  unit = 0
  inverse x = -x
  operation a b = a + b

-- Les réels (non nuls) munis du produit forment un groupe
instance Group Float where
  unit = 1.0
  inverse x = 1/x
  operation a b = a * b


