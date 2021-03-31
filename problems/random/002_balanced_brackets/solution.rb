#!/usr/bin/env ruby

class Brackets
  MAPPING = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }.freeze

  def initialize(brackets)
    @brackets = brackets.split('')
    @opening_brackets = []
  end

  def balanced?
    @brackets.map do |bracket|
      case true
      when opening?(bracket)
        @opening_brackets.push(bracket)
      when matches?(bracket)
        @opening_brackets.pop
      else
        false
      end
    end.all?
  end

  private

  def matches?(bracket)
    MAPPING[@opening_brackets.last] == bracket
  end

  def opening?(bracket)
    MAPPING.keys.include?(bracket)
  end
end

{
  "[]" => true,
  "][" => false,
  "[()]" => true,
  "([)]" => false,
  "([{}])" => true,
  "([]){}[()]" => true,
  "([)]{}[()]" => false,
  "([]){}[({[({{{[]}}})]})]" => true,
}.map { |value, assertion| Brackets.new(value).balanced? == assertion }.all?
