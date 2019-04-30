import Data.List -- elemIndices, searching for element in a list


(^!) :: Num a => a -> Int -> a -- floor square root from haskell wiki
(^!) x n = x^n

squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n =
   let twopows = iterate (^!2) 2
       (lowerRoot, lowerN) =
          last $ takeWhile ((n>=) . snd) $ zip (1:twopows) twopows
       newtonStep x = div (x + div n x) 2
       iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
       isRoot r  =  r^!2 <= n && n < (r+1)^!2
   in  head $ dropWhile (not . isRoot) iters

-- naive using enumeration based on height and filtering


data BT = L | B BT BT deriving Show -- binary trees 

ntrees :: Int -> [BT] -- list of all binary trees of exactly the given height
ntrees 0 = [L]
ntrees n = let p = ntrees (n-1) 
               q = concat [ntrees pn | pn <- [0..n-2]] 
           in [B l r | l <- p, r <- p++q] ++ [B l r | l <- q, r <- p]
           -- at least one subtree of height n-1,  others at most of that height

trees = concat [ntrees n | n <- [0..]] -- list of all binary trees in increasing height

t2s :: BT -> String -- view trees as parse trees for parentheses-grammar
t2s L = ""
t2s (B l r) = "("++(t2s l)++")"++(t2s r)

parens = map t2s trees -- map list of trees to parentheses-strings they generate

d12n :: String -> Int -- map parentheses-string to its index in list
d12n s = head (elemIndices s parens) -- take first of all equal elements

n2d1 :: Int -> String -- map int to parentheses-string at index in list
n2d1 i = parens !! i

-- naive using enumeration based on number of (internal) nodes (i.e. parentheses) and filtering
ntreas :: Int -> [BT]
ntreas 0 = [L]
ntreas n = [B l r |  m <- [0..n-1], l <- ntreas m, r <- ntreas (n-1-m)]

treas = concat [ntreas n | n <- [0..]]

perens = map t2s treas -- map list of trees to parentheses-strings they generate

e12n :: String -> Int -- map parentheses-string to its index in list
e12n s = head (elemIndices s perens)

n2e1 :: Int -> String -- map int to parentheses-string at index in list
n2e1 i = perens !! i

-- more efficient, using cantor pairing, parsing, and generation
-- wrt the parse tree order
  
cantor :: (Integer,Integer) -> Integer
cantor (x,y) = let z = x+y in ((z*(z+1)) `div` 2) + y

parses :: String -> (Integer,String)
parses ('(':s) =
  let (x,s')  = parses s
      (y,s'') = parses (tail s')
  in (1 + cantor(x,y),s'')
parses s = (0,s)

parse :: String -> Integer
parse = fst . parses

uncantor :: Integer -> (Integer,Integer)
uncantor z = (w-y,y) where
  w = ((squareRoot (8*z+1))-1) `div` 2 
  t = (w*w + w) `div` 2
  y = z-t

generate :: Integer -> String
generate 0 = ""
generate z =
  let (x,y) = uncantor (z-1) 
  in "("++(generate x)++")"++(generate y)

test n = (generate (parse s) == s) where s = (concat (replicate n "()"))
