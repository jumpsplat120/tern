---Returns the first value if bool is truthy, and returns the second if falsey. This is a useful shorthand
---for certain cases, where you might want to return a falsey value, such as `b = a == 1 and false or a`,
---as in the example, `b` would be `a`, not `false`, due to how `and/or` operators actually work.
---@param bool any A value or expression to be evaulated as a boolean. Follows truthiness rules, and does not need to explicitly be `true` or `false`.
---@param a any The value to return if `bool` is truthy.
---@param b any The value to return if `bool` is falsey.
---@return any
---@nodiscard
return function(bool, a, b)
    if bool then return a end
    
    return b
end