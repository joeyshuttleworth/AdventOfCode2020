import System.Environment
import Data.List.Split
import Text.Regex.TDFA

entries = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

--    byr (Birth Year)
--    iyr (Issue Year)
--    eyr (Expiration Year)
--    hgt (Height)
--    hcl (Hair Color)
--    ecl (Eye Color)
--    pid (Passport ID)
--    cid (Country ID)


validateEntry :: [String] -> Bool
validateEntry (x:xs)
  | x =~ "byr" = ((read (head xs) :: Int) >= 1920) && ((read (head xs) :: Int) <= 2002)
  | x =~ "iyr" = ((read (head xs) :: Int) >= 2010) && ((read (head xs) :: Int) <= 2020)
  | x =~ "eyr" = ((read (head xs) :: Int) >= 2020) && ((read (head xs) :: Int) <= 2030)
  | (x =~ "hgt") && (head xs) =~ "^[0-9]{3}cm$" = ((read (take 3 (head xs)) :: Int) >= 150) && ((read (take 3 (head xs)) :: Int) <= 193)
  | (x =~ "hgt") && (head xs) =~ "^[0-9]{2}in$" = ((read (take 2 (head xs)) :: Int) >= 59) && ((read (take 2 (head xs)) :: Int) <= 76)
  | x =~ "hcl" = (head xs) =~ "^#[0-9|a-f]{6}$"
  | x =~ "ecl" = (head xs) =~ "^amb|blu|brn|gry|grn|hzl|oth$"
  | x =~ "pid" = (head xs) =~ "^[0-9]{9}$"
  | otherwise  = False

countEntries :: [String] -> Int
countEntries (xs) =
  foldl (\acc x -> acc + if (head $ splitOn ":" x)  `elem` entries then 1 else 0) 0 xs

main :: IO ()
main = do
  fileContents <- readFile "data/day4.txt"
  print(foldl (\acc x -> acc + if (x == 7) then 1 else 0) 0 (map countEntries $ map words $ splitOn "\n\n" fileContents))

main2 :: IO ()
main2 = do
  fileContents <- readFile "data/day4.txt"
  print(length $ filter (==7) (map (\x -> (length (filter validateEntry (map (\a -> splitOn ":" a) (words x))))) $ splitOn "\n\n" fileContents))
