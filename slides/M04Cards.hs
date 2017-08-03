module M03Cards where

data Suit = Spades | Clubs | Hearts | Diamonds
     deriving (Show, Eq, Ord)

data Color = Red | Black
     deriving (Show)

color :: Suit -> Color
color Diamonds = Red
color Hearts = Red
color Clubs = Black
color Spades = Black

color' :: Suit -> Color
color' s | s == Diamonds || s == Hearts = Red
         | s == Clubs || s == Spades = Black


data Rank = Numeric Integer | Jack | Queen | King | Ace
     deriving (Show, Eq, Ord)

-- |rankBeats r1 r2
-- returns True, if r2 beats r1
rankBeats :: Rank -> Rank -> Bool
rankBeats r1 r2 = r1 > r2

data Card = Card Rank Suit
  deriving (Show, Eq)
  
rank :: Card -> Rank
rank (Card r s) = r
suit :: Card -> Suit
suit (Card r s) = s

threeofHearts = Card (Numeric 3) Hearts
aceOfHearts = Card Ace Hearts
aceOfSpades = Card Ace Spades

data Card' = Card' { rank' :: Rank, suit' :: Suit }
     deriving (Show)

cardBeats :: Card -> Card -> Bool
cardBeats c givenCard = suit givenCard == suit c
                        && rankBeats (rank c)
                                     (rank givenCard)

data Hand = Last Card | Next Card Hand
  deriving (Show, Eq)

topCard :: Hand -> Card
topCard (Last c)  = c
topCard (Next c _) = c

-- choose a beating card, if possible
chooseCard :: Card -> Hand -> Card
chooseCard givenCard (Last c) = c
chooseCard givenCard (Next c h) | cardBeats c givenCard = c
                                | otherwise = chooseCard givenCard h

myHand = Next aceOfHearts (Last aceOfSpades)
