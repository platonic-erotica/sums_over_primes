module Math.NT.PrimeCounter where

import Math.NT.Primes

sumChebotarev' :: Int -> Int -> Int
sumChebotarev' x q = sum $ binaryFilter_Chebotarev' ps q
  where ps = filter isPrime $ take x [1..]

binaryFilter_Chebotarev' :: [Int] -> Int -> [Int]
binaryFilter_Chebotarev' ps q = map mappableFilter_Chebotarev  ps
  where mappableFilter_Chebotarev p
          | pEq1_modq p q && nuEq1_modp p q = 1
          | otherwise                       = 0

pEq1_modq :: Int -> Int -> Bool
pEq1_modq p q = (p `mod` q) == 1

nuEq1_modp :: Int -> Int -> Bool
nuEq1_modp p q
  | pM1Eq0_modq p q = ((2 ^ exponent) `mod` p) == 1
  | otherwise       = False
  where exponent = (p-1) `div` q

pM1Eq0_modq :: Int -> Int -> Bool
pM1Eq0_modq p q = ((p - 1) `mod` q) == 1

