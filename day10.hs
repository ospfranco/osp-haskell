{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

toBin :: Int -> [Int]
toBin 0 = [0]
toBin n = reverse (helper n)

helper :: Int -> [Int]
helper 0 = []
helper n = (n `mod` 2) : helper (n `div` 2)

solve :: [Int] -> Int -> Int -> IO()
solve [] cur tmax = putStrLn (show tmax)
solve xs cur tmax = do
    let x = head xs
    case x of
        1 -> do
            let newCur = cur + 1
            let newMax = max tmax newCur
            solve (tail xs) newCur newMax
        0 -> solve (tail xs) 0 tmax


main :: IO()
main = do
    n <- readLn :: IO Int
    let xs = toBin n
    solve xs 0 0