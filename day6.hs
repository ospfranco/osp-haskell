{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
-- import Data.List.Split
-- mapM_ is a Monadic traversable, where you don't care about the return value
-- https://stackoverflow.com/questions/932639/haskell-cant-use-map-putstrln
import Data.Traversable
-- import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe
import Text.Printf

split [] = ([], [])
split [x] = ([x], [])
split (x:y:xs) = (x:xp, y:yp) where (xp, yp) = split xs

solve :: String -> IO()
solve s = do 
            let x = split s
            putStrLn $ fst x ++ " " ++ snd x

main :: IO()
main = do
    n <- readLn :: IO Int
    forM_ [1 .. n] $ \i -> do
        x <- getLine
        solve x
