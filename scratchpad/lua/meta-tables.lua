t = {}

for i = 1, 10 do
  t[i] = i * i
end

mt = {
  __add = function(target, source)
    return 15
    -- ... implementation of table merge
  end,
  __eq = function(t1, t2)
    return false
    -- ... implementation of table equality
  end
}

setmetatable(t, mt)

print(t == t)
print(t + t)
