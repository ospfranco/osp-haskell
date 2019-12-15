module SampFunctions (getClass, doubleEvenNumbers) where
  getClass:: Int -> String
  getClass n = case n of
    5 -> "stuff"
    _ -> "More stuff"
