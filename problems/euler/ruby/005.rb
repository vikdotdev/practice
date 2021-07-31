x = 1
while true do
  return x if (1..20).all? { |n| x % n == 0 }
  x = x + 1
end
