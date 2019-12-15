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

check :: Int -> String
check n
    | (n `mod` 2 /= 0) = "Weird"
    | (n >= 2) && (n <= 5) = "Not Weird"
    | (n >= 6) && (n <= 20) = "Weird"
    | otherwise = "Not Weird"

main :: IO()
main = do
    n <- readLn :: IO Int
    putStrLn (check n)
    