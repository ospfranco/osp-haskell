-- Buble sort with counter
import Control.Applicative
import Control.Monad
import System.IO

-- swapTill :: (Ord a) => [a] -> ([a], Int)
-- swapTill (x:y:xs)
--     | x > y = do
--         let (sortedXs, swaps) = swapTill (x: xs)
--         (y: sortedXs, swaps + 1)
--     | otherwise = do
--         let (sortedXs, swaps) = swapTill (y: xs)
--         (x: sortedXs , swaps) 
-- swapTill (x) = ((x), 0)

-- bubbleSort :: [Int] -> Int -> Int -> ([Int], Int)
-- bubbleSort xs i swaps
--     | i == (length xs) = (xs, swaps)
--     | otherwise = do
--         let (sortedXs, newSwaps) = swapTill(xs)
--         bubbleSort (sortedXs) (i + 1) (swaps + newSwaps)

-- main :: IO ()
-- main = do
--     n_temp <- getLine
--     let n = read n_temp :: Int
--     a_temp <- getLine
--     let xs = map read $ words a_temp :: [Int]
--     let (sorted, swaps) = bubbleSort xs 0 0
--     putStrLn ("Array is sorted in " ++ (show swaps) ++ " swaps.")
--     putStrLn ("First Element: " ++ (show (head sorted)))
--     putStrLn ("Last Element: " ++ (show (last sorted)))

-- Second attempt, using foldl, not much better...
swapTill [] = ([], 0)
swapTill [x] = ([x], 0)
swapTill (x:y:xs)
  | x > y = do
    let (sorted, swaps) = swapTill(x:xs)
    ((y:sorted), swaps + 1)
  | otherwise = do
    let (sorted, swaps) = swapTill(y:xs)
    ((x:sorted), swaps)

nextIter :: ([Int], Int) -> Int-> ([Int], Int)
nextIter (xs, acc) e = do
  let (newSorted, newSwaps) = swapTill xs
  (newSorted, acc + newSwaps)

bubbleSort :: [Int] -> ([Int], Int)
bubbleSort xs = foldl nextIter (xs, 0) xs

main :: IO ()
main = do
  n <- getLine
  a_temp <- getLine
  let xs = map read $ words a_temp :: [Int]
  let (sorted, swaps) = bubbleSort xs
  putStrLn ("Array is sorted in " ++ (show swaps) ++ " swaps.")
  putStrLn ("First Element: " ++ (show (head sorted)))
  putStrLn ("Last Element: " ++ (show (last sorted)))

