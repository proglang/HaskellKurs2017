module M03examples where

import Test.QuickCheck

-- doubles [3,6,12] = [6,12,24]
doubles :: [Integer] -> [Integer]
doubles []     = []
doubles (x:xs) = (2 * x) : doubles xs


prop_doubles xs = doubles xs == doubles' xs

prop_doubles' xs = doubles xs == map double xs

prop_doubles'' xs = doubles xs == map (*2) xs


-- map f [x1, x2, ..., xn] = [f x1, f x2, ..., fn]
mymap :: (a -> b) -> ([a] -> [b])
mymap f []     = []
mymap f (x:xs) = f x : mymap f xs




-- doubles with map
doubles' xs = mymap double xs

double :: Integer -> Integer
double x = 2 * x





-- filter odd [1,2,3,4,5] == [1,3,5]
myfilter :: (a -> Bool) -> [a] -> [a]
myfilter p []     = []
myfilter p (x:xs)
    | p x = x : rest
    | motherwise = rest
  where
    rest = myfilter p xs
    motherwise = True 

myundefined = myundefined
