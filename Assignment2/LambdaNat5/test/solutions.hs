is_empty [] = true
is_empty x:xs = false

fib 0 = 0
fib 1 = 1
fib x = (fib (x - 1)) + (fib (x - 2))

length [] = 0
length x:xs = 1 + (length xs)

even [] = 1
even [a] = 0
even x:y:list = (even list)

append [] [] = []
append [] list_base = list_base
append (x:list_add) list_base = x:(append list_add list_base)

reverse [] = []
reverse x:list = append (reverse list) [x]

weave [] [] = []
weave list1 [] = list1
weave [] list2 = list2
weave (x:list1) (y:list2) = if (x <= y) then x:(weave list1 (y:list2)) else y:(weave (x:list1) list2)

-- Testing
main = do
    print $ is_empty [a] -- 0
    print $ is_empty [] -- 1
    print $ fib 6 -- 8
    print $ length ["a","b","c"] -- 3
    print $ even ["a","b","c","d"] -- 1
    print $ even ["a","b","c","d","e"] -- 0
    print $ reverse ["a","b","c"] -- ["c","b","a"]
    print $ weave [0,1,4] [2,3,5] -- [0,1,2,3,4,5]
