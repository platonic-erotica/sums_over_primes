getTargetPrime :: IO Int
getTargetPrime = do
  putStrLn "Enter a prime number."
  p <- getLine
  return $ read p :: Int
