module Math.NT.PrimeCounter where

sumChebotarev' :: [Int] -> Int
sumChebotarev' primes = sum binaryFilter_Chebotarev' primes

binaryFilter_Chebotarev' :: [Int] -> [Int]
binaryFilter_Chebotarev' primes = map mappableFilter_Chebotarev primes

mappableFilter_Chebotarev :: Int -> Int -> Int
mappableFilter_Chebotarev p q
  | pEq1_modq p q && nuEq1_modp p q = 1
  | otherwise                       = 0

pEq1_modq :: Int -> Int -> Bool
pEq1_modq p q = (p `mod` q) == 1

nuEq1_modp :: Int -> Int -> Bool
nuEq1_modp p q
  | pM1Eq0_modq p q = ((2 ^ exponent) `mod` p) == 1
  | otherwise       = false
  where exponent = (p-1) `div` q

pM1Eq0_modq :: Int -> Int -> Bool
pM1Eq0_modq p q = ((p - 1) `mod` q) == 1
