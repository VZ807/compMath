#set document(title: "Homework #4", author: "Victor Zhang")

#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1.75in),
  header: context {
    if counter(page).get().first() == 1 {
      grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        [Comp Math],
        [Third Homework],
        [September 16, 2026],
      )
    } else {
      grid(
        columns: (1fr, 2fr, 1fr),
        align: (left, center, right),
        [Comp Math],
        [Third Homework, Page #counter(page).display()],
        [],
      )
    }
    v(4pt)
    line(length: 100%, stroke: 0.5pt)
  },
  footer: context {
    align(right)[Page #counter(page).display()]
  },
  header-ascent: 30pt,
)

#set text(size: 12pt)
#set par(
  justify: false,
  leading: 0.65em,
)

#align(center)[
  #text(size: 16pt, weight: "bold")[Homework #3]
  #v(4pt)
  #text(size: 14pt, weight: "bold")[Logic]
]

#v(12pt)

4.1) Show by induction that $2^n < n!, forall n >= 4$
#pad(left: 1cm)[

Base Case: $n=4$

#h(1cm)$2^4 = 16 "and" 4! = 24 "and" 16 < 24$ Our base case is true! 

Inductive hypothesis: Suppose $2^k < k!$ , $k in "ℕ"$

Inductive step: 
  #pad(left: 1cm)[
  $2^(k+1) < (n+1)!$ 

  $2^(k) * 2 < (n)! * (n+1)$

  Lets examine this part closer: 
  $2^(k) * 2 < (n)! * (n+1)$

  We already hypotesized that $2^k < n!$ and for $n >= 4$, $n+1 > 2$.

  So, $2^(k) * 2 < (n)! * (n+1)$ must be true

  Therefore this relation is true as the hypothesis implies that k+1 is true
  ]
]

4.3) Show by induction that $f_0 + ... + f_n = f_(n+2) -1$, for the fibonacci sequence

#pad(left: 1cm)[
Base case: n = 3, $ 0 + 1 + 1 = 3 - 1, "holds true"$

Inductive hypothesis: Suppose $f_0 + ... + f_k = f_(k+2) -1$

Inductive Step: 
  #pad(left : 1cm)[
  For k + 1, we add $f_(k+1)$ on both sides

  $f_0 + ... + f_(k+1) = f_(k+2) + f_(k+1) - 1$

  by the definition of the fib function, $f_(k+2) + f_(k+1) = f_(k+3)$ 
  
  So, $f_0 + ... + f_(k+1) = f_(k+3) - 1$

  Which takes the form of our hypothises
  ]
]

#v(1cm)

4.5) Consider an alternitive fibonacci function starting with 0 , 2, show that 

$(f_0)^2 + ... + (f_(n))^2 = f_n f_(n+1)$

#pad(left: 1cm)[
Base case: n = 0, $0 = 0 * 2$ 

Inductive hypothesis: $(f_0)^2 + ... + (f_(k))^2 = f_k f_(k+1)$

Inductive Step: 
  #pad(left : 1cm)[
    For k + 1 we add $(f_(k+1))^2$ on both sides:

    $(f_0)^2 + ... + (f_(k))^2 + (f_(k+1))^2 = f_k f_(k+1) + (f_(k+1))^2 $

    Factoring out an on the right $(f_(k+1))^2$ gives us 

    $f_(k+1)(f_k + f_(k+1))$

    Which by definition equals

    $f_(k+1)(f_(k+2))$

    so our k + 1 equation looks like this:

    $(f_0)^2 + ... + (f_(k))^2 + (f_(k+1))^2 = f_(k+1)f_(k+2)$

    Which takes the form for our hypothesis, so the relationship holds for all $n >= 0$ 
  ]
]

4.7) Show that a set with $n$ elements has exactly $2^n$ many subsets

#pad(left: 1cm)[
Base case: 

For n = 0, the set {} , has exactly one subset : $emptyset$

Inductive hypothesis: Let $A$ be the name of our set with nnumber of elements $n$, and $b$ be the number of subsets 
  $b = 2^n$

Inductive Step:
  #pad(left : 1cm)[
    Adding a new element to A means that the number of subsets must double, as the all of the 
    added subsets can be writen as an original subset with the new element. 
  
    So, we multiply by 2 on both sides

    $2b = 2^n * 2 -> 2b = 2^(n+1)$

    given that hypothesis implies that n+1 is true, and our base case holds, the relation is true for as n > 0 
  ]
]

4.9) Prove that $1/(1*2) + 1/(2*3) + 1/(3*4) + ... + 1/(n(n+1)) = n/(n+1)$
#pad(left: 1cm)[
Base case: n = 1, $1/(1*2) = 1/(1+1)$

Inductive hypothesis: $sum^k_(j = 1) 1/j(j+1) = k/(k+1)$ 

Inductive Step:
  #pad(left : 1cm)[
    Adding $k +1$ means that we add $1/((k+1)(k+2))$ on both sides 
    
    The LHS resolves by definition of a summation

    The RHS $= k/(k+1) + 1/((k+1)(k+2))$

    Factoring gives us: 

    $k(k+2)/((k+1)(k+2)) + 1/((k+1)(k+2)) = (k^2 + 2k +1)/((k+1)(k+2))$

    dividing by (k+1), we get the result:

    $(n+1)/(n+2)$

    Which takes the form of our hypothesis
  ]
]

4.13) T/F: Every flying polka dotted elephant in this room is smoking a cigar
#pad(left: 1cm)[
Base case: At the time and place of writing this (18:00:20 in South Lobby at the Governors School for Science and Mathmathis) there are no flying polka dotted elephants, so I have no base case
]

4.15) Critique the proof:

#h(1cm) This is not a well formed argument, as n grows larger, and it can as the domain extends to infinity, the assumtion that S(n) is always finite is shaky as the infinite summ for finite terms can still lead ot inifity. the proffer would need to bound the sum and show that it never grows larger than the bound, then the proof would be more sound

#v(3cm)

4.17) Prove that the least number, common indiction principle, and the strong induction principle are all equivalent. Assuming you can prove one, you can prove the others.
#pad(1cm)[
Defining the Common Induction Principle: Suppose that A is an inductive set of natural numbers for which $0 in A "and if" n in A "then" n+1 in A$


Least Number Principle: Given an Inductive Set A, we suppose that there msut be a least number that is not in $A$. we'll call that number $m$ and because its the least number, it follows that $m - 1 in A$ but A is inductive, so $(m-1)+1$ must be in $A$. But thats just $m$. So A musst contain all natural numbers. This proves our Common Induction Principle

Strong Induction Principle: Given a set $A$ where $n$ is an element if all values less than $n$ are in the Set. Means that A contains all natural numbers.

Proof: $0 in A$ is trivially as it requires no smaller numbers.
From there, we can suppose that there might be a least number that is not in A.
But for the least number to not be in the set it must have no predcessors, meaning itsither 0 or a Succesor of 0, but that means that it has all of the numbers leading up to it so there are no least numbers in A and therefore it contains all natural numbers 
  
]

