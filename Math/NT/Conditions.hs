module Math.NT.Conditions where

cond_pq1 :: Int -> Int -> Bool
cond_pq1 p q = (p `mod` q) == 1

cond_hard :: Int -> Int -> Bool
cond_hard p q = ((2 ^ rho) `mod` p) == 1
  where rho = (p - 1) `div` q
  


