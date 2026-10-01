module Hello where
  data Greeting : Set where
    hello : Greeting
    salutations : Greeting
    ahoy : Greeting

  greet : Greeting
  greet = hello

  greet2 : Greeting
  greet2 = ahoy
