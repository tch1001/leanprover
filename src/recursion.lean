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
#check (mbool.rec_on mbool.true one zero)
#check (mbool.rec_on mbool.true one zero : poo)
#check @mbool.rec_on 
#check @mbool.rec_on mbool.true 


variables {d : weekday}
#reduce weekday.rec_on d zero one two three four five six

#check weekday.rec

#reduce one
#reduce seven

variables {A B α β : Type*}
universes x y z
inductive myprod (α : Type x) (β : Type y)
| make : α → β → myprod 

#check myprod
#check myprod.make
def proj1 (α: Type x) (β: Type y) (p: myprod α β): Type x :=
myprod.rec_on   

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
