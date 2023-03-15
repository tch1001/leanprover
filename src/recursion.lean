prelude

universes x y 
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

inductive mynat 
| zero : mynat
| succ : mynat → mynat 

#check myprod mynat mynat

def triple (α : Type x) : Type x :=
myprod (myprod α α) α 

#check triple (mynat)

def n_product (α : Type x) (n : mynat) : Type x :=
@mynat.rec_on (λ _, Type x) n α 
(λ (x : mynat) (y : Type x), myprod y α)  

#reduce n_product mynat mynat.zero
#reduce n_product mynat (mynat.succ mynat.zero)
#reduce n_product mynat (mynat.succ (mynat.succ mynat.zero))
#reduce n_product mynat (mynat.succ (mynat.succ (mynat.succ mynat.zero)))


inductive primrec : (mynat → mynat) → Type 
| zero_fn : primrec (λ _, mynat.zero)

#check primrec
#check primrec.zero_fn
#reduce primrec.zero_fn

variables {k : mynat}
variables {f : n_product mynat k → mynat}
inductive is_PR 
| const : (mynat → mynat) → is_PR


variables C : Type
variables {c : C}
variables {n n1 n2: mynat}
#check @mynat.rec_on 
#reduce @mynat.rec_on (λ _, C) n c 
#reduce @mynat.rec_on (λ _, mynat) n mynat.zero (λ (x: mynat) (y: mynat), mynat.succ y)
#check @mynat.rec_on (λ _, mynat) n mynat.zero (λ (x: mynat) (y: mynat), mynat.succ y)

def test (n : mynat) :=
@mynat.rec_on (λ _, mynat) n mynat.zero (λ (x: mynat) (y: mynat), mynat.succ (mynat.succ y))

#reduce test mynat.zero
#reduce test (mynat.succ mynat.zero)
#reduce test (mynat.succ (mynat.succ mynat.zero))
-- | myprod (myprod α α) α 
