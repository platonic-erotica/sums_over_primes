module Math.NT.Tools where

sieveOfEratosthenes :: Int -> [Int]
sieveOfEratosthenes n | n <= 2     = []
                      | otherwise =
                      where seedLst   = [2..(sqrtBound n)]
                            sqrtBound = floor . sqrt . fromIntegral

--eratosMultiples :: Int -> Int -> [Int]

getMultiples :: Int -> Int -> Set
getMultiples base lim = take firstN allBaseMultiples
  where firstN = (lim - sqBase) `div` base
        allBaseMultiples = map (\i -> sqBase + (i * base)) [0..]
        sqBase = base ^ 2


  
