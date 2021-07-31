#!/usr/bin/env ruby

(900..999).reduce(0) do |acc, x|
  new = (900..999).filter_map do |y|
    product = x * y

    product if product.to_s == product.to_s.reverse
  end.max || 0

  new > acc ? new : acc
end
