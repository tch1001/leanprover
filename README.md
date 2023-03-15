# My Lean Guide

## Inductive
Inductive is a way of constructing a type. It is basically `A : Type` on massive steroids.
- It can be a dependent type
```
inductive A (other: Other)
```
- It provides a way of constructing elements of that type
```
inductive A 
| idk : nat → nat → A
```
In the example above, the type `A` has one way of constructing it: by providing two natural numbers.

## Universes
Apparently there's a difference between the two
```
variables {A B : Type}
variables A B : Type
```
I don't know what it is because `#check` seems to give the same results. But the former works while the latter doesn't (for my pair definition)

## Debugging
Use `eval`, `check`, `print`, `reduce`. One can also put `@` before the term

### Print
`print` seems to be only for function defns in terms of their lambda expressions. As opposed to `check` which will actually let the functions eat parameters (currying)


### Eval
```
def test' (x: poo) : poo := x

#eval test' one
```

`result type does not have an instance of type class 'has_repr', dumping internal representation`
Confusion. but `reduce` seems to do the trick

### Reduce
```
invalid 'weekday.rec_on' application, elaborator has special support for this kind of application (it is handled as an "eliminator"), but the expected type must be known
#reduce weekday.rec_on d zero one two three four five six
```

## Terminology
### Universe
### Sort, Type
### Motive

## Errors


### Recursor
`don't know how to synthesize placeholder`


### Inductive 
```
invalid inductive datatype, resultant type is not a sort
```
comes from something like
```
inductive myprod : (α : Type x) (β : Type y)
| make : α → β → myprod 
```
