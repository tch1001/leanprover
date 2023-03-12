prelude 

variables {α β γ δ : Type*}
#check α
inductive prod (α : Type*) (β : Type*)
| mk : α → β → prod
namespace prod
def const (x : δ) : prod α β → δ := λ (a : prod α β), x

#check prod.rec
#check @prod.rec α β (const γ) 
def rec' : (α → β → γ) → (prod α β → γ) := @prod.rec α β (const γ)

end prod
inductive nat 
| zero : nat 
| succ : nat → nat

namespace nat 
def rec' := @nat.rec (λ _, α)

end nat 

inductive Eq (a : α) : α → Type*
| refl [] : Eq a

namespace Eq 
#check @Eq.rec
end Eq
