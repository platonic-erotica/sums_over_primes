module Math.NT.Primes where

import Data.List

uniqPrimeFactors :: Int -> [Int]
uniqPrimeFactors n = map head . group $ (primeFactors n)

primeFactors :: Int -> [Int]
primeFactors n = iter n primes
  where iter n (p:_) | n < p^2 = [n | n > 1]
        iter n ps@(p:ps') =
          let (d, r) = n `divMod` p
          in if r == 0 then p : iter d ps else iter n ps'

isPrime :: Int -> Bool
isPrime n | n < 2     = False
          | otherwise =  all (\p -> n `mod` p /= 0) . takeWhile ((<= n) . (^ 2)) $ primes

primes :: [Int]
primes = 2: 3: sieve 0 (tail primes) 3

sieve :: Int -> [Int] -> Int -> [Int] 
sieve k (p:ps) x = [n | n <- [x+2,x+4..p*p-2], and [n `rem` p/=0 | p <- fs]]
  where fs = take k (tail primes)
