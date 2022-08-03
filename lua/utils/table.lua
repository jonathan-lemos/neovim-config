require 'utils/function'

-- given a unary function, nil_or's its arg
function nilguard(f)
    return function(x) do
            return f(nil_or(x))
        end
    end
end

-- given a binary function, nil_or's both args
function nilguard2(f)
    return function(x, y) do
            return f(nil_or(x), nil_or(y))
        end
    end
end

-- given a binary function, returns a function that can also take an array of values, performing a left fold using those values
function arrayify2(f)
    return function(x, y)
        if y == nil then
            r = x[1]
            for i = 2, length(x) do
                r = f(r, x[i])
            end
            return r
        else
            return f(x, y)
        end
    end
end

-- returns the argument if it is not nil, otherwise returns {}
function nil_or(a)
    if a == nil then
        return {}
    else
        return a
    end
end

-- merges the second table with the first
merge = nilguard2(function(a, b)
    for k, v in pairs(b) do
        a[k] = v
    end

    return a
end)

-- concatenates the second array to the first
concat = nilguard2(function(a, b)
    for i = 1, #b do
        a[#a + 1] = b[i]
    end

    return a
end)

-- iterates the keys of a table
keys = nilguard(function(t)
    k, v = nil, nil
    return function()
        k, v = next(t, k)
        return v
    end
end)

-- return the values of a table
values = nilguard(function(t)
    k, v = nil, nil
    return function()
        k, v = next(t, k)
        return v
    end
end)

-- returns the number of keys of a table. O(n)
function length(t)
    local i = 0
    for _ in keys(t) do
        i = i + 1
    end
    return i
end

-- performs a left fold on t's values using f
-- if a seed is not given, uses the first value of t as the seed
function reduce(t, f, seed)
    t = nil_or(t)
    if seed == nil then
        local ks = keys(t)
        local acc = t[ks[1]]

        for i = 2, length(t) do
            acc = f(acc, t[ks[1]])
        end

        return acc
    else
        local acc = seed

        for v in values(t) do
            acc = f(acc, v)
        end

        return acc
    end
end

-- transforms the values of t using f
function fmap(t, f)
    t = nil_or(t)
    local r = {}

    for k, v in pairs(t) do
        r[k] = f(v)
    end

    return r
end

-- removes pairs of t where p(t) returns false
function filter(t, p)
    t = nil_or(t)
    local r = {}

    for k, v in pairs(t) do
        if p(v) then
            r[k] = v
        end
    end

    return r
end

-- returns true if p(x) returns true for all values (x) in t
function all(t, p)
    t = nil_or(t)
    for v in values(t) do
        if not p(v) then
            return false
        end
    end
    return true
end

-- returns a shallow copy of t
function table_copy(t)
    return filter(t, const(true))
end

-- returns true if 'a' is an array
function isarray(a)
    return type(a) == 'table' and all(function(k) k:match("%D") end)
end
