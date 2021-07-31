case ['Abby', 20]
in [Integer, Integer] => coords
  puts coords
in [String, Integer] => name_age
  puts name_age
end

# when different data structures used for same purpose
struct = { x: 33, y: 99, z: 30 }
# struct = [33, 99, 30]

case struct
in { x: , y: , z: } => all #| [cx, cy ,cz] => all
  puts all.inspect
  puts x, y, z
end

# pin operator
case [1,2,2]
in [a,^a,^a]
  puts a
in [a,b,^b]
  puts a, b
end

case [2,2]
in [_, a]
  puts 'a'
  puts a
in [b, ^b]
  puts 'b'
  puts b
end

[
  { real_name: { first: 'John', last: 'Doe'}, username: 'jdoe' },
  { real_name: { first: 'John', last: 'Doe'} },
  { username: 'jdoe' }
].map do |user|
  case user
  in { username:, real_name: { first:, last: }}
    "#{username} #{first} #{last}"
  in { real_name: { first:, last: }}
    "#{first} #{last}"
  in {username:}
    username
  else
    'New User'
  end
end

class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def deconstruct
    puts "deconstruct called"
    [@x, @y]
  end

  def deconstruct_keys(keys)
    puts "deconstruct keys called"
    {x: @x, y: @y}
  end
end

c = Coordinate.new(20,33)

case c
in {x:, y:}
  puts 'as hash'
  puts x, y
in [x, y]
  puts 'as array'
  puts x, y
end


# EXPERIMENTAL
# 'in' variant returns true of false
{ foo: 1, bar: 2 } in { foo: f }
f
{ foo: 1, bar: 2 } in { foo: }
foo
[1,2,3] in [first,2,3]
first

{ foo: 1, bar: 2 } in { baz: bazzz }
bazzz
{ foo: 1, bar: 2 } in { baz: }
baz

# arrow variant returns nil or throws
{ foo: 1, bar: 2 } => { bar: bar }
bar
{ foo: 1, bar: 2 } => { baz: bazzz }
bazzz

test = {
  { foo: 1, bar: 2 } => { baz: bazzz }
}
{ foo: 1, bar: 2 }.hash
test[{ foo: 1, bar: 2 }]


[1, 2, 3, 4, 5, 6] in [first, *, second_to_last, last]
first
second_to_last
last

[1, 2, 3, 4, 5, 6] in [first, *rest, last]
first
rest
last

