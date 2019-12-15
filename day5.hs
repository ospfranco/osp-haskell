{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
-- mapM_ is a Monadic traversable, where you don't care about the return value
-- https://stackoverflow.com/questions/932639/haskell-cant-use-map-putstrln
import Data.Traversable
-- import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

multiples10 :: Int -> [String]
multiples10 n = [ show n ++ " x " ++ show x ++ " = " ++ show (x * n) | x <- [1..10]]


main :: IO()
main = do
    n <- readLn :: IO Int
    mapM_ putStrLn (multiples10 n)