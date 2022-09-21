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
  deriving (Eq,Show) -- for equality and printing

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
-- nn_pp :: PP -> NN

-- convert numbers of type PP to numbers of type II
-- ii_pp :: PP -> II

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
multI :: II -> II
multI (II ni nj) = (II (nj ni))

----------------
-- QQ Arithmetic
----------------


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
