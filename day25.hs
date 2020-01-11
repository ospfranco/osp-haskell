import Control.Applicative
import Control.Monad
import System.IO

main :: IO ()
main = interact $ unlines . map ( bToS . isPrime . read) . drop 1 . lines
bToS True = "Prime"
bToS False = "Not prime"

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n = all ((/=0) . mod n) . takeWhile ((<=n) . (^2)) $ [2..]
