-- asserts that f is a function, otherwise throws an error saying 'n' is not a function. optionally give a level (default 1) to determine at what level the actual error occurs
function assert_is_fn(f, n, level)
    if level == nil then
        level = 1
    end
    if not type(f) == "function" then
        error(n .. " is supposed to be a function, but is actually a " .. type(f), level + 1)
    end
end

-- given f and g, returns a function f(g(x))
function compose(f, g)
    assert_is_fn(f, "f", 2)
    assert_is_fn(g, "g", 2)
    return function(x)
        return f(g(x))
    end
end

-- returns a function that always returns the given value
function const(v)
    return function(_)
        return v
    end
end

-- returns a function that gets a key of a table
function dot(p)
    return function(t)
        return t[p]
    end
end

