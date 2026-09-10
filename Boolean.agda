open import Equality 

module Boolean where 

    data Bool : Set where 
        true  : Bool
        false : Bool 

    id : Bool → Bool 
    id b =  b  

    not : Bool → Bool 
    not false = true 
    not true = false 

    always-true : Bool → Bool 
    always-true b = true

    always-false : Bool → Bool 
    always-false b = false

    and : Bool → Bool → Bool 
    and true q = q
    and false q = false

    _∧_ : Bool → Bool → Bool 
    p ∧ q = and p q

    infixr 6 _∧_ 

    or : Bool → Bool → Bool 
    or true q = true
    or false q = q

    _∨_ : Bool → Bool → Bool 
    x ∨ y = or x y

    -- ∨ is right-associative and will bind slightly weaker than ∧ by convention. 
    -- Both will bind stronger than ≡ 
    infixr 5 _∨_ 

    -- The logical (exclusive) OR operator 
    -- You can pattern match completely on p and q 
    -- or try to "short circuit". 
    xor : Bool → Bool → Bool 
    xor true true = false
    xor true false = true
    xor false true = true
    xor false false = true

    -- Type ⊕ with \oplus 
    -- Alias for our exclusive OR function 
    _⊕_ : Bool → Bool → Bool 
    p ⊕ q = xor p q 


    ife : {A : Set} -> Bool -> A -> A -> A
    ife true x y = x
    ife false x y = y

    -- ⊕ is right-associative and will bind at the same precedence as ∨ 
    -- this means if you use both in an expression, you may have to remove
    -- ambiguity with parentheses 
    infixr 5 _⊕_

    -------------------------------------------------------------
    -- Theorems for Booleans
    -------------------------------------------------------------

    -- These proofs require the use of refl 
    -- from the equality data type _≡_ 
    -- defined in Equality.agda 

    -- A Note on Identity
    -- When learning algebra you learned that basic 
    -- operations like + and · have 'identities', even if you 
    -- weren't told they were called that. For example,
    -- 0 is the 'right-identity' for + because x + 0 = x for all x. 1 is
    -- the 'right-identity' for · because x · 1 = x for all x. 
    -- (0 is also the 'left-identity' for + and 1 is the 'left-identity' for ·, can you 
    -- think of the equations that justify these facts and explain why we say 'left' and 'right'? 
    -- We will prove these facts in Lab 2 about the natural numbers ℕ.)
    -- Boolean operations also have identity values!

    -- The left-identity of inclusive OR is FALSE. 
    -- We can use an _ as an 'anonymous' name for a variable 
    -- when we don't need to use it in an argument.
    -- Since false ∨ b reduces to b by definition, refl is enough!
    ∨-identl : (b : Bool) → false ∨ b ≡ b 
    ∨-identl _ = refl

    -- The right-identity of inclusive OR is FALSE. 
    -- Pattern match on b.
    ∨-identr : (b : Bool) → b ∨ false ≡ b 
    ∨-identr true = refl
    ∨-identr false = refl  
  

    -- The left-identity of AND is TRUE. 
    ∧-identl : (b : Bool) → true ∧ b ≡ b 
    ∧-identl true = refl
    ∧-identl false = refl

    -- The right-identity of AND is TRUE. 
    -- Pattern match on b. 
    ∧-identr : (b : Bool) → b ∧ true ≡ b 
    ∧-identr true = refl
    ∧-identr false = refl

    -- If 0 preserves identity for the addition operation +,
    -- what does it do for the multiplication operation · ? 
    -- It annihilates! Anything times 0 becomes 0! What are the
    -- annihilators, the 'zeros' for the boolean operations AND and OR? 
    -- Again, we will consider from both the left and right.

    -- TRUE is the zero element for OR on the left 
    ∨-zerol : (b : Bool) → true ∨ b ≡ true 
    ∨-zerol true = refl
    ∨-zerol false = refl

    -- TRUE is also the zero element for OR on the right 
    ∨-zeror : (b : Bool) → b ∨ true ≡ true 
    ∨-zeror true = refl
    ∨-zeror false = refl
    
    -- FALSE is the zero element for AND on the left 
    ∧-zerol : (b : Bool) → false ∧ b ≡ false 
    ∧-zerol true = refl
    ∧-zerol false = refl

    -- FALSE is also the zero element for AND on the right 
    ∧-zeror : (b : Bool) → b ∧ false ≡ false 
    ∧-zeror true = refl
    ∧-zeror false = refl

    -- An INVOLUTION is a function that is its own inverse. 
    -- Prove that NOT is involutive. 
    not-involutive : ∀ (b : Bool) → not (not b) ≡ b
    not-involutive true = refl
    not-involutive false = refl

    -- In class we discussed an 'algebra of boolean connectives' and 
    -- identified properties of ∧ and ∨ such as commutative, associative, etc. 
    -- Such properties can be verified by hand with truth tables. 
    -- Instead, we will use Agda to check them. 

    -- AND is commutative 
    ∧-comm : (p q : Bool) → p ∧ q ≡ q ∧ p 
    ∧-comm true true = refl
    ∧-comm true false = refl
    ∧-comm false true = refl
    ∧-comm false false = refl

    -- OR is commutative     
    ∨-comm : (p q : Bool) → p ∨ q ≡ q ∨ p 
    ∨-comm true true = refl
    ∨-comm true false = refl
    ∨-comm false true = refl
    ∨-comm false false = refl  

    -- AND is associative 
    ∧-assoc : (p q r : Bool) → p ∧ (q ∧ r) ≡ (p ∧ q) ∧ r 
    ∧-assoc true q r = refl
    ∧-assoc false q r = refl
    
    -- OR is associative 
    ∨-assoc : (p q r : Bool) → p ∨ (q ∨ r) ≡ (p ∨ q) ∨ r 
    ∨-assoc true q r = refl
    ∨-assoc false q r = refl

    -- AND distributes from the left over OR 
    and-distribl-or : (p q r : Bool) → p ∧ (q ∨ r) ≡ (p ∧ q) ∨ (p ∧ r) 
    and-distribl-or true q r = refl
    and-distribl-or false q r = refl

    -- OR distributes from the left over AND 
    or-distribl-and : (p q r : Bool) → p ∨ (q ∧ r) ≡ (p ∨ q) ∧ (p ∨ r) 
    or-distribl-and true q r = refl
    or-distribl-and false q r = refl

    -- BUH-BUH-BUH-BUH BOSS BATTLE 
    -- For your final exercises in this lab, define and prove
    -- BOTH versions of DeMorgan's laws.
    -- You will need to determine the appropriate types and implement the functions.  

    -- demorgan1 : 
    demorgan1 : (p q : Bool) -> not (p ∧ q) ≡ (not p) ∨ (not q)
    demorgan1 true true = refl
    demorgan1 true false = refl
    demorgan1 false true = refl
    demorgan1 false false = refl


    -- demorgan2 : 
    demorgan2 : (p q : Bool) ->  not (p ∧ q) ≡ (not p) ∨ (not q) 
    demorgan2 true true = refl
    demorgan2 true false = refl
    demorgan2 false true = refl
    demorgan2 false false = refl

    --------------------------------------------------------

    -- Comments and Acknowledgements

    -- Peng Fu, Peter Selinger, and Sandy Maguire influenced 
    -- the development of this document.

    --------------------------------------------------------


