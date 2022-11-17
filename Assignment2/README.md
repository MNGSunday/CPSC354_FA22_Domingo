# Critical Appraisal

- Group Members: Marc Domingo
- Date of Submission: 11/18/2022

## Modifications made
- For the evalCBN case of *ETl*, when *e* of *(ETl e)* is evaluated, if *e* results in *ENil* (#), the end of a list and the indication of an empty list if ENil is the head, my program defines the **tail of an empty list to also be ENil**.
- The `length`,  `even`, `append`, and `reverse` functions in `solutions.hc` had to be renamed to `l_length`, `is_even`, `l_append`, and `l_reverse` respectively to avoid reusing the Prelude Haskell function names.

## Observations and Questions
- `#:#` does not parse but `(#):#` is likely able to parse based on the fact that while the former `#:#` is equivalent to an empty list, #, with the "head" and the "tail" of the list conceptually being equal to #, the latter `(#):#` could be interpreted as a list of lists, with the first list within that list being an empty list. Because of this, I do not believe that the grammar should be changed.
- I found it interesting that within the `LambdaNat4.cf` file, separator is considered its own expression and contributes to the number of Coercions counted towards the bottom of the file, and that the separator expression does not need to include `::=`.
- As for the following code:
    ```
    evalCBN (EPlus e1 e2) = (evalCBN e1) + (evalCBN e2)
    ```
    we could not perform arithmetic in LambdaNat5 the same way that we did for the calculator (Assignment 1) because this wholly assumes that e1 and e2 are integers or a form of number that can be used with the `+ operator`, when in reality, e1 and e2 could potentially be any type of variable or input. Because of this, within LambdaNat5, we had to evaluate e1 and e2 separately to verify that they are actually integer types before being able to use the `+ operator`, or any of the other arithmetic operators for that matter. 
    
    - Because of the possibility of either operand not being an integer or number, `+,-,*` in LambdaNat5 are implemented using call-by-value. This ensures that the operands are evaluated and verified to actually be integers before the actual arithmetic operators can be used, and if either are not integers, does not evaluate using the arithmetic operators.
- Compared to programming in Haskell, programming in LambdaNat5 felt both similar to Haskell programming due to the fact that we had the "let `name`= `value` in `function`" naming scheme, but felt strange in the fact that recursive pattern-matching had to be implemented using `let rec` in combination with nested `if-then-else` statements. While it makes sense from the context in which the LambdaNat5 language was written, it felt a lot different from the functional programming language Haskell, which already greatly differed from other high-level programming languages. As far as a functioning programming language goes, LambdaNat5 closely resembles a functional programming languages, but still lacks the other arithmetic operators and the other variable types such as Booleans. Extending LambdaNat5 with the other variable types and the other pre-built in functions found within Haskell would definitely pave the way for it to be a more powerful functional programming language.
- For `weave`, as it satisfies the invariant of "if the output-list is sorted, then the input-lists are sorted", the invariant could be used to prove that `sort` actually returns a list in sorted order. Because of how `weave` is programmed, it will always attempt to sort the input-lists based according to the (current) first elements of each list. As `weave` will produce a sorted output-list if both input-lists are sorted, `sort` can be proved to actually sort if it is applied to both the input-lists prior to being inputted to `weave`, then it should result in the same sorted list as `sort` being applied to the resulting `weave` list.
- One major question that I had was why the solution for the `subst` case for `ELet` was:
	````
	subst id s (ELet i e1 e2) = subst id s (EApp (EAbs i e2) e1)
	````
	instead of
	````
	subst id s (ELet i e1 e2) = ELet (i (subst id s e1) (subst id s e2))
	````
	as the latter case followed the followed the structure of the `subst` cases for the other functions, whereas the actual solution to the `subst` case for `ELet` and `ERec` are completely different from the rest. 
- One thing that I found odd while testing the LambdaNat5 language was that while the assignment instructions say to execute the `solutions.lc` file using `cabal exec LambdaNat-exe test/solutions.lc`, I was only able to run the file using `cabal run LambdaNat-exe test/solutions.lc`. It might have been an issue with using Ubuntu without attaching to Docker.
- While attempting to test `solutions.hc` for `Task 3` in this assignment, I completely forgot that the functions `length`, `even`, `append`, and `reverse` exist within the Prelude module of Haskell, based on the error code of `Ambiguous occurrence` and the fact that attempting to compile the code without any modifications to the function names (`length` for this example) would result in confusion between `Prelude.length` and `Main.length` makes me wonder if it was possible to clear the ambiguity by replacing every instance of `length` with `Main.length` in the code.
