#!/usr/bin/env ruby

class ReversedPolishNotation
  def initialize(expression)
    @expression = expression.split(' ')
  end

  def evaluate
    return @expression.last if @expression.one?

    @expression.each_with_index do |char, index|
      replace_at(index) && break if operator?(char)
    end

    evaluate
  end

  private

  def replace_at(index)
    range = (index - 2)..index
    x, y, operator = @expression.slice(range)

    @expression[range] = x.to_i.send(operator, y.to_i)
  end

  def operator?(char)
    /[*+-\/]{1}/.match?(char.to_s)
  end

  def number?(char)
    /[0-9]{1}/.match?(char.to_s)
  end
end

[
  ReversedPolishNotation.new('2 4 +').evaluate == 6,
  ReversedPolishNotation.new("2 4 * 8 +").evaluate == 16,
  ReversedPolishNotation.new("2 4 8 + *").evaluate == 24,
  ReversedPolishNotation.new("3 2 * 11 -").evaluate == -5,
  ReversedPolishNotation.new("2 5 * 4 + 3 2 * 1 + /").evaluate == 2
].all?
