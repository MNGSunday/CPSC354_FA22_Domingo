len [] = 0
len (x:xs) = 1 + len xs

select_evens [] = []
select_evens [a] = []
select_evens (x:y:list) = y:(select_evens list)

select_odds [] = []
select_odds [a] = [a]
select_odds (x:y:list) = x:(select_odds list)

member _ [] = False
member n (x:xs)
  | x == n = True
  | otherwise = member n xs

append [] _ = []
append list_original [] = list_original
append list_original (x:list_add) = append (list_original ++ [x]) list_add

revert [] = []
revert (item:xs) = (revert xs) ++ [item]

less_equal [] [] = True
less_equal (x:list_one) (y:list_two) = if x <= y
									  then less_equal list_one list_two
									  else False