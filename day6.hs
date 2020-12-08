import System.Environment
import Data.List.Split
import Data.Sort


countUniqueChars :: String -> Int
countUniqueChars[]  = 0
countUniqueChars(x) = 1 + countUniqueChars (filter (/=(head x)) x)

countIfNOccurences :: Int -> String -> Int
countIfNOccurences(x) [] = 0
countIfNOccurences(x) str = (if (length (filter (==(head str)) str)==x) then 1 else 0) + countIfNOccurences x (filter (/=(head str)) str)

main :: IO ()
main = do
  fileContents <- readFile "data/day6.txt"
  print(sum $ map (countUniqueChars . concat . lines) $ splitOn "\n\n" fileContents)

main2 :: IO ()
main2 = do
  fileContents <- readFile "data/day6.txt"
  print(sum $ map (\a -> countIfNOccurences (length(lines a)) (concat (lines a))) $ splitOn "\n\n" fileContents)
