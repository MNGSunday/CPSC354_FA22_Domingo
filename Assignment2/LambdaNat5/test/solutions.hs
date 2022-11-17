is_empty [] = 1
is_empty (x:xs) = 0

fib 0 = 0
fib 1 = 1
fib x = (fib (x - 1)) + (fib (x - 2))

l_length [] = 0
l_length (x:xs) = 1 + (l_length xs)

is_even [] = 1
is_even [a] = 0
is_even (x:y:list) = (is_even list)

l_append [] [] = []
l_append [] list_base = list_base
l_append (x:list_add) list_base = x:(l_append list_add list_base)

l_reverse [] = []
l_reverse (x:list) = l_append (l_reverse list) [x]

weave [] [] = []
weave list1 [] = list1
weave [] list2 = list2
weave (x:list1) (y:list2) = if (x <= y) then x:(weave list1 (y:list2)) else y:(weave (x:list1) list2)

-- Testing
main = do
    print $ is_empty ["a"] -- 0
    print $ is_empty [] -- 1
    print $ fib 6 -- 8
    print $ l_length ["a","b","c"] -- 3
    print $ is_even ["a","b","c","d"] -- 1
    print $ is_even ["a","b","c","d","e"] -- 0
    print $ l_reverse ["a","b","c"] -- ["c","b","a"]
    print $ weave [0,1,4] [2,3,5] -- [0,1,2,3,4,5]
