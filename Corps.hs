module Corps where


class (Eq a, Ord a) => Corps a where
    unitadd :: a
    inverseadd :: a -> a
    operationadd :: a -> a -> a
    unitmul :: a
    operationmul :: a -> a -> a
    inversemul :: a -> a




instance Corps Integer where
    unitadd = 0
    inverseadd x = -x
    operationadd x y = x+y
    unitmul = 1
    operationmul x y = x*y
    inversemul x    | x == 0 = 0
                    | otherwise = 1 `div` x