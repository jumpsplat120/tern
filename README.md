# tern
Helper function for ternary functionality in lua.

Functions exactly like you think it would.

```lua
tern(bool, a, b)

local value1 = "hello"
local value2 = tern(value1 == "hello", "world", "planet")

print(value1, value2) -- "hello", "world"
```
Returns the first value if `bool` is truthy, and returns the second if falsey. This is a useful shorthand for certain cases within lua, where you might want to return a falsey value, such as `b = a == 1 and false or a`.

In a language with a true ternary, assuming that `a` did in fact equal `1`, an expression such as that would evaluate to `false`. However, in lua, you might be surprised when it in fact, evaulated to `a` instead. Why is this? Well, `and` and `or` operators are not ternary's, they just function like it in most cases. Pulled from the [manual](https://www.lua.org/manual/5.4/manual.html#:~:text=The%20conjunction%20operator,only%20if%20necessary.),
> The conjunction operator and returns its first argument if this value is false or nil; otherwise, and returns its second argument. The disjunction operator or returns its first argument if this value is different from nil and false; otherwise, or returns its second argument. Both and and or use short-circuit evaluation; that is, the second operand is evaluated only if necessary.

This means, in our example, `a == 1 and false` is evaulated to `false`, then `false or a` is evaluated to `a`.

The `tern` function avoids this problem by simply using if statements internally. "But couldn't I just use if statements?" Yes. Yes you could. This function is entirely a helper function meant to reduce code length, but it's value is minimal. You could just as easily write `if a == 1 then b = false else b = a end`, or `b = a; b = a == 1 and false`. There's lots of different solutions to this simple problem; this is just one more. It's short, simple, and functions like an actual ternary, rather than just pretending to be one most of the time. However, there is the downside of the extra function call for a simple if statement, so keep that in mind before using it anywhere you'd use an `and/or` statement instead.