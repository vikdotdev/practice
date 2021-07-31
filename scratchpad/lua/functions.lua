function sum(x, y)
  return x + y
end

print(sum(1, 4))

function string_split(str, delim)
  str_table = {}

  local i = 1
  for word in string.gmatch(str, delim) do
    print(word)
    str_table[i] = word
    i = i + 1
  end

  return str_table, i
end

result_table, size = string_split('hello world', "[^%s]+")

for j = 1, size do
  print(string.format("%d:%s", j, result_table[j]))
end

function varargs(...)
  local sum = 0

  for _key, value in pairs{...} do
    sum = sum + value
  end

  return sum
end
print(varargs(1,2,3,4,5))

doubleMe = function(n) return n * 2 end

print(doubleMe(10))

-- closures
function outer()
  local i = 0

  return function()
    i = i + 1

    return i
  end
end

inner = outer()
print(inner())
print(inner())

