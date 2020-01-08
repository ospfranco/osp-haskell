{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Map
import Data.Maybe
import System.Environment
import System.IO
import System.IO.Unsafe

lookupPhone :: Map String String -> IO()
lookupPhone m = do
    s <- getLine
    let result = Data.Map.lookup s m
    case result of
        Nothing -> putStrLn "Not found"
        phone -> putStrLn $ s ++ "=" ++ (fromJust phone)
    lookupPhone m

consume :: Map String String -> Int -> IO()
consume m 0 = lookupPhone m
consume m n = do
  temp <- getLine
  let [name, phone] = words temp
  let nm = insert name phone m
  consume nm (n - 1)

main :: IO()
main = do
    n <- readLn :: IO Int
    let dict = fromList [] :: Map String String
    consume dict n
