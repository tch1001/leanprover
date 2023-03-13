prelude

universes x y l
variables {A B : Type}
variables a : A
variables b : B
inductive myprod (α : Type x) (β : Type y)
| make : α → β → myprod 
def proj1 (p: myprod A B): A :=
@myprod.rec_on A B (λ _, A) p (λ a b, a)
def proj1' (p: myprod A B): A :=
@myprod.rec A B (λ _, A) (λ a b, a) p
def proj2 (p: myprod A B): B := 
@myprod.rec_on A B (λ _, B) p (λ a b, b)
def proj2' (p: myprod A B): B :=
@myprod.rec A B (λ _, B) (λ a b, b) p

#reduce proj1 (myprod.make a b)
#reduce proj1' (myprod.make a b)
#reduce proj2 (myprod.make a b)
#reduce proj2' (myprod.make a b)