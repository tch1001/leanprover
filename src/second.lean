prelude 

universe l
inductive poo : Sort l
| zero : poo
| succ : poo → poo

def zero : poo := poo.zero
def one : poo := poo.succ zero
def two : poo := poo.succ one
def three : poo := poo.succ two
def four : poo := poo.succ three
def five : poo := poo.succ four
def six : poo := poo.succ five
def seven : poo := poo.succ six

-- def proj1 (A: Type) (B: Type) (p: times A B) : A := p.1

inductive weekday : Type
| sunday : weekday
| monday : weekday
| tuesday : weekday
| wednesday : weekday
| thursday : weekday
| friday : weekday
| saturday : weekday

def number_of_day (d: weekday) : poo :=
weekday.rec_on d 
zero
one
two
three
four
five
six

inductive mbool : Type
| false: mbool
| true: mbool

#check mbool.rec_on 
#check @mbool.rec_on 
#check (mbool.rec_on mbool.true)
#check (mbool.rec_on mbool.false)
#check (mbool.rec_on mbool.true one zero)
#check (mbool.rec_on mbool.true one zero : poo)
#reduce (mbool.rec_on mbool.true one zero : poo)
#reduce (mbool.rec_on mbool.true zero one : poo)
#check (mbool.rec_on mbool.true (one: poo) (mbool.true: mbool))
#check @mbool.rec_on mbool.true 
#check @mbool.rec 
#check (mbool.rec zero one : poo)
#print mbool.rec_on
#reduce mbool.rec_on
#check mbool.rec
#check @mbool.rec 
#check mbool.rec zero 


variables {d : weekday}
#check (weekday.rec_on d zero one two three four five six : poo)

#check weekday.rec

#reduce one
#reduce seven

variables {A B C D E F G α β : Type*}
universes x y z

#check @mbool.rec_on 
#check mbool.rec_on 
#check @poo.rec_on 
#check poo.rec_on 
#check @myprod.rec_on
#check myprod.make

variables {a : A}
variables {b : B}
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

variables {p : myprod A B}
#check @myprod.rec
#check @myprod.rec_on
#check @myprod.rec_on A B 
#reduce @myprod.rec_on A B (λ _, C) p 
#reduce @myprod.rec_on A B (λ _, A) p (λ a b, a)
#reduce myprod.rec 
#check @myprod.rec A B 
#check myprod.rec 
def p1 : A → B → A := (λ a b, a)
#check myprod.rec p1 

variables {c : C}
variables {cc : Type*}
#check @myprod.rec_on A B (λ _, C) p (λ _ _, c)
#reduce @myprod.rec_on A B (λ _, C) p ((λ _ _, ccc): )
#reduce @myprod.rec_on A B (λ _, C) p (λ _ _, )

def idk : (Π (a : A) (b : B), myprod A B) := (λ a b, myprod.make a b)
#check @myprod.rec_on 
#check myprod.rec_on p idk
#check myprod.rec_on p (λ _ _, c) 
#check @myprod.rec_on (λ a b, a)














variables {d : weekday}
#check weekday.rec_on d 
#reduce weekday.rec_on d 
#check weekday.rec 
#print weekday.rec_on d

def motif (w : weekday) : Sort l := poo

-- def test : Π (x: poo), poo := 

def test' (x: poo) : poo := x

#reduce test' one

#check motif
#reduce weekday.rec 

#reduce myprod.rec_on 
