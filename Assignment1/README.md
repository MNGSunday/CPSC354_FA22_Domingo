# Critical Appraisal

- Group Members: Marc Domingo
- Date of Submission: 9/30/2022

## Part 1
Computations for functions from Arithmetic.hs:



	int_pp (multP (pp_int 3) (pp_int 4)) =
		int_pp (multP (T (pp_int 2)) (T (pp_int 3))) =
		int_pp (multP (T (T (pp_int 1))) (T (T (pp_int 2)))) =
		int_pp (multP (T (T (I))) (T (T (T (pp_int 1))))) =
		int_pp (multP (T (T (I))) (T (T (T (I))))) =
		int_pp (addP (multP (T (I)) (T (T (T (I))))) (T (T (T (I))))) =
		int_pp (addP (addP (multP (I) (T (T (T (I))))) (T (T (T (I))))) (T (T (T (I))))) =
		int_pp (addP (addP (T (T (T (I)))) (T (T (T (I))))) (T (T (T (I))))) =
		int_pp (addP (T (addP (T (T (I))) (T (T (T (I)))))) (T (T (T (I))))) =
		int_pp (addP (T (T (addP (T (I)) (T (T (T (I))))))) (T (T (T (I))))) =
		int_pp (addP (T (T (T (addP (I) (T (T (T (I)))))))) (T (T (T (I))))) =
		int_pp (addP (T (T (T (T (T (T (T (I)))))))) (T (T (T (I))))) =
	    int_pp (T (addP (T (T (T (T (T (T (I))))))) (T (T (T (I)))))) =
	    int_pp (T (T (addP (T (T (T (T (T (I)))))) (T (T (T (I))))))) =
	    int_pp (T (T (T (addP (T (T (T (T (I))))) (T (T (T (I)))))))) =
	    int_pp (T (T (T (T (addP (T (T (T (I)))) (T (T (T (I))))))))) =
	    int_pp (T (T (T (T (T (addP (T (T (I))) (T (T (T (I)))))))))) =
	    int_pp (T (T (T (T (T (T (addP (T (I)) (T (T (T (I))))))))))) =
	    int_pp (T (T (T (T (T (T (T (addP (I) (T (T (T (I)))))))))))) =
	    int_pp (T (T (T (T (T (T (T (T (T (T (T (I)))))))))))) =
	    1 + int_pp (T (T (T (T (T (T (T (T (T (T (I))))))))))) =
	    2 + int_pp (T (T (T (T (T (T (T (T (T (I)))))))))) =
	    3 + int_pp (T (T (T (T (T (T (T (T (I))))))))) =
	    4 + int_pp (T (T (T (T (T (T (T (I)))))))) =
	    5 + int_pp (T (T (T (T (T (T (I))))))) =
	    6 + int_pp (T (T (T (T (T (I)))))) =
	    7 + int_pp (T (T (T (T (I))))) =
	    8 + int_pp (T (T (T (I)))) =
	    9 + int_pp (T (T (I))) =
	    10 + int_pp (T (I)) =
	    11 + int_pp (I) =
	    12
	    
	int_ii (negI (ii_int 4)) =
		int_ii (negI (II (nn_int 4) O)) =
		int_ii (negI (II (S (nn_int 3)) O)) =
		int_ii (negI (II (S (S (nn_int 2))) O)) =
		int_ii (negI (II (S (S (S (nn_int 1)))) O)) =
		int_ii (negI (II (S (S (S (S (nn_int O))))) O)) =
		int_ii (negI (II (S (S (S (S (O))))) O)) =
		int_ii (II O (S (S (S (S (O)))))) =
		(-1) * (int_nn (S (S (S (S (O)))))) =
		(-1) * (1 + int_nn (S (S (S (O))))) =
		(-1) * (2 + int_nn (S (S (O)))) =
		(-1) * (3 + int_nn (S (O))) =
		(-1) * (4 + int_nn (O)) =
		(-1) * (4 + 0) =
		(-1) * (4) =
		-4
		
	subN (nn_int 2) (nn_int 3) =
		subN (S (nn_int 1)) (S (nn_int 2)) =
		subN (S (S (nn_int 0))) (S (S (nn_int 1))) =
		subN (S (S (O))) (S (S (S (nn_int 0)))) =
		subN (S (S (O))) (S (S (S (O)))) =
		subN (S (O)) (S (S (O))) =
		subN (O) (S (O)) =
		O
	
	lessN (nn_int 1) (nn_int 2) =
		lessN (S (nn_int 0)) (S (nn_int 1)) =
		lessN (S (O)) (S (S (nn_int 0))) =
		lessN (S (O)) (S (S (O))) =
		lessN (subN (S (O)) (S (S (O)))) (S (S (O))) =
		lessN (subN (O) (S (O))) (S (S (O))) =
		lessN (O) (S (S (O))) =
		(S O)
		
	int_ii (normalizeI (II (nn_int 1) (nn_int 2))) =
		int_ii (normalizeI (II (S (nn_int 0)) (S (nn_int 1)))) =
		int_ii (normalizeI (II (S (O)) (S (S (nn_int 0))))) =
		int_ii (normalizeI (II (S (O)) (S (S (O))))) =
		int_ii (II (subN (S (O)) (S (S (O)))) (subN (S (S (O))) (S (O)))) =
		int_ii (II (subN (O) (S (O))) (subN (S (O)) (O))) =
		int_ii (II O (S (O))) =
		(-1) * (int_nn (S (O))) =
		(-1) * (1 + int_nn (O)) =
		(-1) * (1 + 0) =
		(-1) * (1) =
		-1 

	Overall, for Part 1 of Assignment 1, I primarily learned about how rationals and integers, along with their respective arithmetic, can be implemented based on the rules that we have established regarding Natural Numbers (NN) and Positive Numbers (PP). I found it particularly interesting that a "less than" function for Natural Numbers would require 4 different cases including the recursive case, and was more surprised about how useful a "less than" function would be in both modulo and division. What I did find difficult about Part 1 was primarily just float_qq, as what I found online regarding casting an int as a float did not work, and was only able to fix the function during office hours. Adding "fromIntegral" as a tip for converting integers to floats would be helpful for future classes doing the assignment.

## Part 2

Though the code itself for Part 2 compiles, I have not tested the programs thouroughly prior to submitting this assignment.

	For Part 2 of Assignment 1, I learned a lot about specific operators that Haskell does not let you use integers on, namely "/" due to being used for float division. I found navigating Hoogle to be simultaneously interesting and confusing regarding the types that each Haskell function is able to use, and possibly having a brief video explanation for browsing and interpreting Hoogle could be helpful for future classes.
	In terms of the order of operations for the calculator, I attempted to follow PEMDAS (Parenthases-> Exponent ->Multiplication & Division -> Addition & Subtraction). In order to accomplish this, I followed the initial numbers.cf example that we started with through the assignment, which, in order to have multiplication prioritized over addition, had the Times rule closer to the Num rule. This ended up being reflected in the grammar of numbers.cf as I had the least-prioritized operations (Plus and Minus) farther from the Num case, and higher-prioritized operations (Neg and Squared) closer to the Num case.