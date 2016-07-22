module Main where

import Math.NT.Primes

main :: IO ()
main = do
  input <- readInputPrime
  putStrLn "--- Prime numbers l such that l | (p - 1) --- "
  putStrLn . show $ pM1Divisors input

readInputPrime :: IO Int
readInputPrime = do
  putStrLn "Enter a prime number."
  p <- getLine
  return $ read p

pM1Divisors :: Int -> [Int]
pM1Divisors p = uniqPrimeFactors (p - 1)
