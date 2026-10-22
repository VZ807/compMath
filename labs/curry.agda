module curry where


  open import Nat
  open import Boolean

  data Pair (A B : Set) : Set where
    _,_ : A -> B -> Pair A B

  curry : {A B C : Set} -> (Pair A B -> C) -> A -> B -> C
  curry f = λ a -> λ b → f (a , b)

  uncurry : {A B C : Set} -> (A -> B -> C) -> (Pair A B -> C)
  uncurry g (a , b) = g a b

  fst : {A B : Set} -> Pair A B -> A
  fst (a , b) = a

  snd : {A B : Set} -> Pair A B -> B
  snd (a , b) = b
