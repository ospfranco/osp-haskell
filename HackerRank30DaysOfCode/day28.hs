-- Initial snippet, contains a for! 
-- {-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

-- module Main where

-- import Control.Monad
-- import Data.Array
-- import Data.Bits
-- import Data.List
-- import Data.List.Split
-- import Data.Set
-- import Debug.Trace
-- import System.Environment
-- import System.IO
-- import System.IO.Unsafe



-- main :: IO()
-- main = do
--     N <- readLn :: IO Int

--     forM_ [1..N] $ \N_itr -> do
--         firstNameEmailIDTemp <- getLine
--         let firstNameEmailID = words firstNameEmailIDTemp

--         let firstName = firstNameEmailID !! 0

--         let emailID = firstNameEmailID !! 1

import Control.Applicative
import Control.Monad
import System.IO
import Data.List
import Text.Regex.PCRE

regex = "[a-zA-Z0-9+._-]+@gmail\\.com"

main :: IO()
main = interact $ unlines . sort . map extractName . filter filterGmail . map words . drop 1 . lines

-- extractName :: [String] -> String
extractName (name:email:xs) = name



-- Takes an array of 2 (it will always be size 2), returns only name
-- filterGmail :: [String] -> Bool
filterGmail (name:email:xs) = email =~ regex :: Bool