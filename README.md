# Haskell-Maybe-Monad-and-State-Monad

This Haskell project demonstrates the use of **Maybe Monad** and **State Monad** through various examples, including safe mathematical operations, counter state management, and a simple pseudo-random number generator.

---

## Features

1. **Maybe Monad**:
   - Handles errors for operations like square roots of negative numbers or division by zero.
2. **State Monad - Counter**:
   - Manages a counter with increment and decrement operations.
3. **State Monad - Random Number Generator**:
   - Generates deterministic random numbers based on a seed.

---

## How to Run

1. Save the code to a file named `Solutions.hs`.
2. Open a terminal and load it in GHCi:
   ```bash
   ghci Solutions.hs
   ```
3. Run the `main` function to see an example of counter operations:
   ```haskell
   main
   ```

---

## Example Usage

### 1. Maybe Monad
- Safely compute the square root:
  ```haskell
  safeSqrt 9       -- Output: Just 3.0
  safeSqrt (-4)    -- Output: Nothing
  ```

- Combine square root and reciprocal operations:
  ```haskell
  combinedOperations 9   -- Output: Just 0.3333333333333333
  combinedOperations (-4) -- Output: Nothing
  ```

### 2. State Monad - Counter
- Perform counter operations:
  ```haskell
  evalState runOperations 0  -- Output: 1
  evalState runOperations 10 -- Output: 12
  ```

### 3. State Monad - Random Number Generator
- Generate a random number:
  ```haskell
  runPRNG fresh 42
  -- Output: A deterministic random number based on the seed
  ```

- Example usage of random generator:
  ```haskell
  exampleRandomUsage
  -- Output: Prints a random number to the console
  ```

---

## Requirements

- Install the Haskell Platform (GHC and GHCi) to run the code.

---

## License

This project is open-source and can be modified freely.
