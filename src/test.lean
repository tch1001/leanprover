-- prelude
universe u v

#check Nat
def m : Nat := Nat.zero.succ
def n : Nat := Nat.succ Nat.zero
#check m
#eval n

#check Sort u
#check Sort imax (u+2) (v+4)
#check Sort (u+1)
#check Sort 5

#check Prop
#check Type
#check Type 1
#check Type 2

variable {n : nat}

#check Type u
#check Sort

inductive days : Type
| monday 
| tuesday : days

def noDay (d: days) : Nat :=
  match d with 
    | days.monday => 0
    | days.tuesday => 1

#eval noDay days.monday
#eval noDay days.tuesday
#print days.casesOn
#check @days.casesOn
#print days.rec

noncomputable def noDay' (d: days) : Nat :=
  @days.rec (fun _ => Nat) 0 1 d

#check @days.rec
#check @days.rec (fun _ => Nat)
#check @days.rec (fun _ => Nat) 0 1 days.monday

def noDay'' (d: days) : Nat :=
  @days.casesOn (fun _ => Nat) d 0 1

def noDay''' (d: days) : Nat :=
  days.casesOn d 0 1

#eval noDay''' days.tuesday

#eval @days.casesOn (fun _ => Nat) days.monday 0 1 


inductive myprod (α : Type x) (β : Type y) : Type (max x y)
| make : α → β → myprod 

#eval (1:Nat)-(2:Nat)
#eval (1:Int)-(2:Int)

def N : Type := Nat
def three : N := (3 : Nat)

abbrev N' : Type := Nat
def three' : N' := 3

structure Point3D where 
  -- pt :: -- override constructor name mk
  x : Float
  y : Float
  z : Float
deriving Repr

#check (Point3D.mk 1 2 3.5 )
#eval Point3D.mk 1 2 3.5 

structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def natOrigin : PPoint Nat :=
  { x := Nat.zero, y := Nat.zero }

def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

#check replaceX

inductive Sign where | pos | neg deriving Repr

def pm (n : Int) : Sign :=
  if n > (0:Int) then Sign.pos else Sign.neg

#eval pm (1 : Int)
#eval pm (-1 : Int)

def negative(s : Sign) : Bool :=
  match s with
  | Sign.pos => false
  | Sign.neg => true

-- this works too
-- def pm2 (s : Sign) : (if negative s then Int else Nat) 
def pm2 (s : Sign) : match s with 
| Sign.neg => Int
| Sign.pos => Nat
 :=
  match s with
  | Sign.pos => (1 : Nat)
  | Sign.neg => (-1 : Int)