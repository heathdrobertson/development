import Data.List

numUniqes :: (Eq a) => [a] -> Int
numUniqes = length . nub

main = putStrLn "Hello Heath's Haskell World"

