import System.Environment
import Data.List.Split
import Data.Sort

getRow :: String -> Int
getRow x =
  (foldl (\acc a -> 2*acc +  (if (a=='B') then 1 else 0)) 0 x)

getCol x =
  (foldl (\acc a -> 2*acc +  (if (a=='R') then 1 else 0)) 0 x)

getId :: String -> Int
getId x =
  (8*getRow (fst $ splitAt 7 x) + getCol (snd $ splitAt 7 x))

main :: IO ()
main = do
  fileContents <- readFile "data/day5.txt"
  print(maximum $ map getId $ splitOn "\n" fileContents)


findMissing :: [Int] -> Int
findMissing [] = -1
findMissing (x:xs) = if 1 + x /= (head xs) then 1 + x else findMissing xs

main2 :: IO ()
main2 = do
  fileContents <- readFile "data/day5.txt"
  print(findMissing $ tail (sort $ map getId $ splitOn "\n" fileContents))

