-- First version
-- import Control.Applicative
-- import Control.Monad
-- import System.IO
-- import Data.Bits

-- main = interact $ unlines . map foo . map words . drop 1 . lines

-- foo (nS:kS:xs) = do
--     let n = read nS :: Int
--     let k = read kS :: Int
--     let diffs = [ (.&.) x y | x <- [1..(n - 1)], y <- [(x + 1)..n]]
--     let filteredDiffs = show $ (maximum . filter (<k)) diffs
--     show $ maximum filteredDiffs


-- Second version
-- import Control.Applicative
-- import Control.Monad
-- import System.IO
-- import Data.Bits

-- main = interact $ unlines . map foo . map words . drop 1 . lines

-- foo (nS:kS:xs) = do
--     let n = read nS :: Int
--     let k = read kS :: Int
--     let diffs = [ (.&.) x y | x <- [1..(n - 1)], y <- [(x + 1)..n]]
--     show $ (maximum . filter (<k)) diffs

import Control.Applicative
import Control.Monad
import System.IO
import Data.Bits

main = interact $ unlines . map (show . solve . words) . drop 1 . lines

solve (n0:k0:_) = do
    let n = read n0 :: Int
    let k = read k0 :: Int
    maximum $ filter (<k) [ (.&.) x y | x <- [1..(n - 1)], y <- [(x + 1)..n]]