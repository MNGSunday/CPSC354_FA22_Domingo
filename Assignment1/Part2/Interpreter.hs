module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Minus n m) = (eval n) - (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Div n m) = divide (eval n) (eval m)
eval (Mod n m) = mod (eval n) (eval m)
eval (Pow n m) = (eval n) ^ (eval m)
eval (Root n m) = Root (eval n) (eval m)
eval (Neg n) = -(eval n)
