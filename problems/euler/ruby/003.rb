#!/usr/bin/env ruby

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# Prime numbers - numbers which can be divided evenly on by 1 or itself.
# Prime factor - prime factor is finding which prime numbers multiply together
#   to make the original number. Example: The prime factors of 15 are 3 and 5.

require 'prime'

# Initial solution before I learned that Ruby has Prime class
class PrimeFactors
  PRIMES = Prime.take(1000)

  def self.of(number)
    new(number).find
  end

  def initialize(number)
    @number = number.to_f
    @prime_factors = []
  end

  def find(divisor_index = 0)
    current_prime = PRIMES[divisor_index]
    quotient = @number / current_prime

    return @prime_factors.push(current_prime) if quotient == 1

    if integer?(quotient)
      @number = quotient
      @prime_factors << current_prime

      find(divisor_index)
    else
      find(divisor_index + 1)
    end
  end

  private

  def integer?(number)
    (number % 1).zero?
  end
end

PrimeFactors.of(600_851_475_143).max

# Or a better one...
Prime.prime_division(600_851_475_143).last.first
