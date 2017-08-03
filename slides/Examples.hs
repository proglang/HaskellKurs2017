import Test.QuickCheck

dollarRate = 1.3671

price = 79

price' :: Double
price' = 79

-- |convert EUR to USD
usd euros = euros * dollarRate

-- |convert USD to EUR
euro usds = usds / dollarRate

-- |roundtrip conversion should be identity
prop_EuroUSD x = euro (usd x) == x

-- |working roundtrip conversion using approximate equality
prop_EuroUSD' x = euro (usd x) ~== x

-- |almost equal operator
x ~== y = abs (x - y) <= abs x * 1E-15


-------------------------

-- compute x to n-th power
power :: Double -> Integer -> Double
power x 0         = 1
power x n | n > 0 = x * power x (n - 1)

dumme_summe n = summe_acc n 0
summe_acc 0 s = s
summe_acc n s | n > 0 = summe_acc (n-1) (s+n)

-- function over lists - examples
summerize :: [String] -> String
summerize []  = "None"
summerize (x:[]) = "Only " ++ x
summerize (x:y:[]) = "Two things: " ++ x ++ " and " ++ y
summerize [_,_,_] = "Three things: ???"
summerize _   = "Several things."   -- wild card pattern
  
-- not: nogo (x,x) = x
nogo (x, y) | x == y = x
nogo (x, y) = y
