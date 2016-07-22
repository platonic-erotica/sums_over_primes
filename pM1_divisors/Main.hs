module Main where

import Math.NT.Primes

main :: IO ()
main = do
  input <- readInputPrime
  if isPrime input then (displayDivisors input) else (displayError input)

displayDivisors :: Int -> IO ()
displayDivisors input = do
  putStrLn ("--- Set p = " ++ (show input) ++ " ---")
  putStrLn "--- Prime numbers l such that l | (p - 1) --- "
  putStrLn . show $ pM1Divisors input

displayError :: Int -> IO ()
displayError input = do
  putStrLn ((show input) ++ " is not a prime number.")

readInputPrime :: IO Int
readInputPrime = do
  putStrLn "Enter a prime number."
  p <- getLine
  return $ read p

pM1Divisors :: Int -> [Int]
pM1Divisors p = uniqPrimeFactors (p - 1)
