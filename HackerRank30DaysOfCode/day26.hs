-- Lifted from somebody else's solution, the way he reads the input is very elegant
import System.IO

main :: IO ()
main = interact $ show . calculateFine . map read . words

calculateFine :: [Int] -> Int
calculateFine [d0,m0,y0,d1,m1,y1]
  | y0<y1 || (y0==y1 && m0<m1) || (y0==y1 && m0==m1 && d0<=d1) = 0
  | y0==y1 && m0==m1 && d0>d1 = 15*(d0-d1)
  | y0==y1 && m0>m1 = 500*(m0-m1)
  | y0>y1 = 10000
  | otherwise = 0