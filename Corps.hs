module Corps where
import Anneau


class (Anneau a) => Corps a where
    inversemul :: a -> a




instance Corps Integer where
    inversemul x    | x == 0 = 0
                    | otherwise = 1 `div` x