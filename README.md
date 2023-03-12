# My Lean Guide

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
