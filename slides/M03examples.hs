module M03examples where

-- doubles [3,6,12] = [6,12,24]
doubles :: [Integer] -> [Integer]
doubles []     = undefined
doubles (x:xs) = undefined

-- map f [x1, x2, ..., xn] = [f x1, f x2, ..., fn]
mymap f []     = undefined
mymap f (x:xs) = undefined

-- doubles with map
doubles' xs = mymap double xs

double :: Integer -> Integer
double x = undefined

-- filter odd [1,2,3,4,5] == [1,3,5]
myfilter :: (a -> Bool) -> [a] -> [a]
myfilter p []       = undefined
myfilter p (x:xs) = undefined
