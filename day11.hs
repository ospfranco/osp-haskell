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



readMultipleLinesAsStringArray :: Int -> IO [String]
readMultipleLinesAsStringArray 0 = return []
readMultipleLinesAsStringArray n = do
    line <- getLine
    rest <- readMultipleLinesAsStringArray(n - 1)
    return (line : rest)

hourglassSum :: [[Int]] -> Int -> Int -> Int
hourglassSum m i j = (m !! i !! j) + (m !! i !! (j + 1)) + (m !! i !! (j + 2)) + (m !! (i + 1 ) !! (j + 1)) + (m !! (i + 2) !! j) + (m !! (i + 2) !! (j + 1)) + (m !! (i + 2) !! (j + 2))

solve :: [[Int]] -> Int -> Int -> Int -> IO()
solve m 4 j tmax = putStr $ show tmax
solve m i 4 tmax = solve m (i + 1) 0 tmax
solve m i j tmax = do
    let curr = hourglassSum m i j
    let newMax = max tmax curr
    solve m i (j + 1) newMax

main :: IO()
main = do
    arrTemp <- readMultipleLinesAsStringArray 6
    let arr = Data.List.map (\x -> Data.List.map (read :: String -> Int) . words $ x) arrTemp
    solve arr 0 1 (hourglassSum arr 0 0)