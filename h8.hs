-- File: Solutions.hs

-- Importing necessary modules
import Control.Monad.State

-- Problem 1: Maybe Monad
safeSqrt :: Double -> Maybe Double
safeSqrt x
  | x >= 0    = Just (sqrt x)
  | otherwise = Nothing

safeReciprocal :: Double -> Maybe Double
safeReciprocal x
  | x /= 0    = Just (1 / x)
  | otherwise = Nothing

combinedOperations :: Double -> Maybe Double
combinedOperations x = do
  sqrtVal <- safeSqrt x
  safeReciprocal sqrtVal

-- Problem 2: State Monad - 1
type CounterState = Int

increment :: State CounterState ()
increment = modify (+1)

decrement :: State CounterState ()
decrement = modify (subtract 1)

runOperations :: State CounterState Int
runOperations = do
  increment
  increment
  decrement
  get

main :: IO ()
main = do
  let initialState = 0
      finalState = evalState runOperations initialState
  putStrLn ("Final counter value: " ++ show finalState)

-- Problem 3: State Monad - 2
type Random a = State Int a

fresh :: Random Int
fresh = do
  seed <- get
  let newSeed = (6364136223846793005 * seed + 1442695040888963407) `mod` (2 ^ 64)
  put newSeed
  return (fromIntegral newSeed)

runPRNG :: Random a -> Int -> a
runPRNG rand initialSeed = evalState rand initialSeed

-- Example usage of the Random generator
exampleRandomUsage :: IO ()
exampleRandomUsage = do
  let initialSeed = 42
      randomNumber = runPRNG fresh initialSeed
  putStrLn ("Generated random number: " ++ show randomNumber)
