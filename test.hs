import Data.List
import System.IO

factorial n = product [1..n]
average xs = sum xs `div` length xs

-- There was an error in the following piece of code, compiler helps to check it
n = a `div` length xs
  where
    a = 10
    xs = [1,2,3,4,5]

-- Implement last based on other functions
last1 xs = head (drop (length xs -1 ) xs)
last2 xs = xs !! (length xs - 1)
last3 xs = head (reverse xs)


-- lambda
dbl1To10 = map (\x -> x * 2) [1..10]

-- comparison operators < > <= >= == /= (last one is not equal to)
-- && || not


-- List operation with filters
listTimes3OnlyOdd = [x * 3 | x <- [1..100], x `mod` 2 /= 0]

-- This is not working why? I thought one can apply multiple filter functions
listTimes3OnlyOddOnlyLargerThan200 = [x * 3 | x <- [1..100], x `mod` 2 /= 0, x > 50]


-- if operator
doubleEvenNumber y =
    if(y `mod` 2 /= 0 )
      then y
      else y * 2

-- pattern matching
getClass :: Int -> String
getClass n = case n of 
  5 -> "Go to kindergarten"
  6 -> "Go to grundschüle"
  _ -> "Go somewhere else"


-- enumerated types
data BaseballPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfield
                  deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True

barryInOF = print(barryBonds Outfield)

-- custom datatypes (struct)
data Customer = Customer String String Double 
  deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

-- Rock paper scissors
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Bears Rock"
shoot _ _ = "NON IMPLEMENTED"

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
  deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
-- area (Rectangle x y x2 y2) = (abs (x2 - x)) * (abs (y2 - y))
-- Functionaly equal to above, $ only gets rids of parenthesis
-- Means everything that comes after it, takes precedence of everything that comes before it
area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ 2 - y)


-- This two are the same
sumValue = putStrLn( show (1 +  2))
-- Dot operator allows to chain functions to pass IO from the value on the right to the value on left
sumValue2 = putStrLn . show $ 1 + 2


areaOfCircle = area(Circle 50 60 20)
areaOfRect = area $ Rectangle 10 10 100 100

-- Type Classes
-- :t (+)
-- (+) :: Num a => a -> a -> a
data Employee = Employee { name :: String,
                          position :: String,
                          idNum :: Int
                          } deriving (Eq, Show)

johnSmith = Employee { name = "John Smith", position = "Manager", idNum = 100}
laraSmith = Employee { name = "Lara Smith", position = "Sales", idNum = 101}

isJohnLara = johnSmith == laraSmith

johnSmithData = show johnSmith

-- Another example

data ShirtSize = S | M | L
instance Eq ShirtSize where
  S == S = True
  M == M = True
  L == L = True
  _ == _ = False

instance Show ShirtSize where
  show S = "Small"
  show M = "Medium"
  show L = "Large"

smallAvail = S `elem` [S, M, L]

theSize = show S

class MyEq a where
  areEqual :: a -> a -> Bool

instance MyEq ShirtSize where
  areEqual S S = True
  areEqual M M = True
  areEqual L L = True
  areEqual _ _ = False

newSize = areEqual M M

-- input examples

sayHello = do
  putStrLn "What is your name"
  name <- getLine
  putStrLn $ "Hello" ++ name

writeToFile = do
  theFile <- openFile "test.txt" WriteMode
  hPutStrLn theFile $ "Random line of text"
  hClose theFile

readFromFile = do
  theFile2 <- openFile "test.txt" ReadMode
  contents <- hGetContents theFile2
  putStr contents
  hClose theFile2


-- Fibonnaci code
-- This is some sort of generator function! will continue to return the last value of the recursion
fib = 1 : 1 : [ a + b | (a, b) <- zip fib (tail fib)]

-- *Main> zip [1,1,1,1,1] (tail [2,3,3,3])
-- Outputs: [(1,3),(1,3),(1,3)]
-- *Main> zip [4,1,1,1,1] (tail [2,3,3,3])
-- Outputs: [(4,3),(1,3),(1,3)]
-- *Main> zip [1, 1] (tail [1,1])
-- Outputs: [(1,1)]
-- *Main> zip [1, 1, 2] (tail [1,1, 2])
-- Outputs: [(1,1),(1,2)]
-- *Main> zip [1, 1, 2, 3] (tail [1, 1, 2, 3])
-- Outputs: [(1,1),(1,2),(2,3)]

