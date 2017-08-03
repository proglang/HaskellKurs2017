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

