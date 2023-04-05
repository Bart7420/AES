module Anneau where

class Anneau a where
  unitadd :: a
  inverseadd :: a -> a
  operationadd :: a -> a -> a
  unitmul :: a
  operationmul :: a -> a -> a


instance Anneau Integer where
    unitadd = 0
    inverseadd x = -x
    operationadd x y = x+y
    unitmul = 1
    operationmul x y = x*y