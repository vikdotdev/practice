co = coroutine.create(function() 
  for i = 1, 10 do
    print(i)
    if i == 5 then coroutine.yield() end
  end
end)

print(coroutine.status(co))
print(coroutine.resume(co))
print(coroutine.status(co))

co2 = coroutine.create(function() 
  for i = 101, 110 do
    print(i)
  end
end)

print(coroutine.resume(co2))
print(coroutine.resume(co))
