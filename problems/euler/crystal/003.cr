# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# Prime numbers - numbers which can be divided evenly on by 1 or itself.
# Prime factor - prime factor is finding which prime numbers multiply together
#   to make the original number. Example: The prime factors of 15 are 3 and 5.

# TARGET_NUMBER = 600_851_475_143
TARGET_NUMBER = 13195

puts (2...TARGET_NUMBER).reduce([] of Int64) do |acc, n|
  number = (TARGET_NUMBER / n.to_f64)
  puts n if number.modulo(1).zero?
  number.modulo(1).zero? ? acc.push(number.to_i64) : acc
end.max
