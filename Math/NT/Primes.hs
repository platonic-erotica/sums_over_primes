module Math.NT.Primes where

import Data.Numbers.Primes
import Data.List

uniqPrimeFactors :: Int -> [Int]
uniqPrimeFactors n = map head . group $ (primeFactors n)

primeFactors' :: Int -> [Int]
primeFactors' m = primeFactors m
  
isPrime :: Int -> Bool
isPrime n | n < 2     = False
          | otherwise =  all (\p -> n `mod` p /= 0) . takeWhile ((<= n) . (^ 2)) $ primes

primeList :: [Int]
primeList = 2 : filter (\n-> head (primeFactors n) == n) [3,5..]
