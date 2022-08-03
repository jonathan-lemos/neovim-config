-- returns true if str starts with start
function starts_with(str, start)
   return str:sub(1, #start) == start
end

-- returns true if str ends with ending
function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end
