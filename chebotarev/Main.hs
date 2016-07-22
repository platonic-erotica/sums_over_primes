module Main where

import Math.NT.Primes
import Math.NT.PrimeCounter

main :: IO ()
main = do
  p        <- getInputPrime
  divisors <- return $ pM1Divisors p
  displayDivisors divisors
  q        <- getQ
  putStrLn "Chebotarev:"
  putStrLn . show $ sumChebotarev' p q
  
getInputPrime :: IO Int
getInputPrime = do
  putStrLn "Enter a prime number."
  p <- getLine
  putStrLn ("--- Set p = " ++ (show p) ++ " ---")
  return $ (read p :: Int)

displayDivisors :: [Int] -> IO ()
displayDivisors divisors = do
  putStrLn "--- Prime numbers l such that l | (p - 1) --- "
  putStrLn $ show divisors

getQ :: IO Int
getQ = do
  putStrLn "Enter a choice of divisor."
  strQ <- getLine
  putStrLn ("--- Setting q = " ++ (show strQ) ++ " ---")
  return $ (read strQ :: Int)

displayError :: Int -> IO ()
displayError input = do
  putStrLn ((show input) ++ " is not a prime number.")

pM1Divisors :: Int -> [Int]
pM1Divisors p = uniqPrimeFactors (p - 1)
