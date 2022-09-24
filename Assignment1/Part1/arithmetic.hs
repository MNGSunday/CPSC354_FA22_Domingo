-- A Virtual Machine (VM) for Arithmetic (template)
-- Copyright: Alexander Kurz 2022

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving Show -- define equality below

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving (Eq,Show) -- for equality and printing

-- Rational numbers
data QQ =  QQ II PP
  deriving Show -- define equality below

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- PP Arithmetic
----------------
-- add positive numbers
addP :: PP -> PP -> PP
addP I m = T (m)
addP (T n) m = T (addP n m)

-- multiply positive numbers
multP :: PP -> PP -> PP
multP I m = m
multP (T n) m = addP (multP n m) m

-- convert numbers of type PP to numbers of type NN
nn_pp :: PP -> NN
nn_pp I = (S O)
nn_pp (T p) = S (nn_pp p)

-- convert numbers of type PP to numbers of type II
-- ii_pp :: PP -> II
ii_pp I = II (nn_pp I) O
ii_pp (T p) = II (nn_pp (T p)) O

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

-- subtract natural numbers
subN :: NN -> NN -> NN
subN O O = O
subN O n = O
subN n O = n
subN (S n) (S m) = (subN n m)

-- "less than" for natural numbers
lessN :: NN -> NN -> NN
lessN O O = (S O)
lessN O n = (S O)
lessN n O = O
lessN n m = lessN (subN n m) m

-- divide natural numbers
divN :: NN -> PP -> NN
divN O p = O
divN n p
  | lessN (subN n (nn_pp p)) (nn_pp p) == O = S (divN (subN n (nn_pp p)) p) -- if n is not less than p, recursively run divide with n = n - p
  | otherwise = O -- if n is less than p, return O

-- modulo/remainder for natural numbers
modN :: NN -> PP -> NN
modN O p = O
modN n p
  | lessN (subN n (nn_pp p)) (nn_pp p) == O = modN (subN n (nn_pp p)) p -- if n is not less than p, recursively run modulo with n = n - p
  | otherwise = n -- if n is less than p, then return n

----------------
-- II Arithmetic
----------------

-- addition
addI :: II -> II -> II
addI (II ni nj) (II mi mj) = (II (addN ni mi) (addN nj mj))

-- multiplication
multI :: II -> II -> II
multI (II ni nj) (II mi mj) = (II (multN ni mi) (multN nj mj))

-- negation
negI :: II -> II
negI (II ni nj) = II nj ni

-- Equality of integers
-- instance Eq II where
  -- (II a b) == (II c d) = <insert your code here>

----------------
-- QQ Arithmetic
----------------

-- addition
addQ :: QQ -> QQ -> QQ
addQ (QQ (II ni mi) pi) (QQ (II nj mj) pj) = (QQ (addI ((multI (II ni mi) (II (nn_pp pi) O))) ((multI (II nj mj) (II (nn_pp pi) O)))) (multP pi pj))

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
multQ :: QQ -> QQ -> QQ
multQ (QQ (II ni mi) pi) (QQ (II nj mj) pj) = (QQ (multI (II ni mi) (II nj mj)) (multP pi pj))

-- Equality of fractions
-- instance Eq QQ where
  -- (QQ a b) == (QQ c d) = <insert your code here>

----------------
-- Normalisation
----------------

-- normalizeI :: II -> II

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

-- Precondition: Inputs are non-negative
nn_int :: Integer -> NN
nn_int 0 = O
nn_int x = S (nn_int (x - 1))

int_nn :: NN->Integer
int_nn O = 0
int_nn (S n) = 1 + (int_nn n)

ii_int :: Integer -> II
ii_int 0 = (II O O)
ii_int x = (II (nn_int x) O)

-- int_ii :: II -> Integer

-- Precondition: Inputs are positive
-- pp_int :: Integer -> PP

-- int_pp :: PP->Integer

-- float_qq :: QQ -> Float

------------------------------
-- Normalisation by Evaluation
------------------------------

--nbe :: II -> II

----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O) -- S (S (S O))
    print $ multN (S (S O)) (S (S (S O))) -- S (S (S (S (S (S O)))))

    print $ addP (T (T I)) (T I) -- T (T (T (T I)))
    print $ multP (T (T I)) (T (T (T I)))
