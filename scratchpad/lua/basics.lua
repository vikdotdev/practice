x = 3
y = 3

str = [[ very long
 string]]
print(str .. str)

-- .. contact operator

-- [[ multiline string ]]

-- what is table?
print(type(math))
-- ~= is !=, actual != is not used

math.randomseed(os.time())
print(math.random())
print(math.random(5, 10))

if x < 3 then
  print('yes')
  local im_local = 10
elseif x > 3 and x == 5 then
  print('second')
else
  print('third')
end


if true then print('oneliner') end


print(string.format("not true = %s", tostring(not true)))

-- no traditional ternary in lua
if false then print('oneliner') else print('improvised ternary') end

-- no such thing as switch statement


long = "teset test test teset test testteset test testteset test testteset test testteset test testteset test testteset test testteset test testteset test test"

-- check the size of string with #
print(#long)
print(string.gsub(long, 'test', 'haha'), '\n')
-- does not mutate
print(long)
print(string.find(long, 'test'))

i = 0

-- lua does not have continue statement
while (i < 10) do
  print(i)
  i = i + 1

  if i == 8 then break end
end
print('\n')

i = 0
-- basically a do-while loop
-- repeat
--   guess = io.read()
-- until tonumber(guess) == 10


for i = 0, 10, 1 do
  print(i)
end

-- table array, basically array
days = {4, 2, 1}

for key, value in pairs(days) do
  print(key, value)
end

my_table = {}

for i = 1, 10 do
  my_table[i] = i * i
  print(my_table[i])
  print(#my_table)
end

table.insert(my_table, 10, 'hello')
print(my_table[10])


print(table.concat(my_table, ', '))
-- actually mutates this array
table.remove(my_table, 1)
print(my_table[1])

print(5.3 % 3)


-- print(vim.json_decode('{ "hello": "test" }'))
--
fun




