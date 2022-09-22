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
  deriving (Eq,Show) -- for equality and printing

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
lessN n m = (lessN (subN n m) m)

-- divide natural numbers
-- divN :: NN -> PP -> NN
-- divN O PP = O
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

----------------
-- QQ Arithmetic
----------------

-- addition
-- addQ :: QQ -> QQ -> QQ
-- addQ (QQ (II ni mi) pi) (QQ (II nj mj) pj) = (QQ (addI (multI (ni mi) (ii_pp pi)) (multI (nj mj) (pi O))) (multP pi pj))

----------------
-- Normalisation
----------------


----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O) -- S (S (S O))
    print $ multN (S (S O)) (S (S (S O))) -- S (S (S (S (S (S O)))))

    print $ addP (T (T I)) (T I) -- T (T (T (T I)))
    print $ multP (T (T I)) (T (T (T I)))
