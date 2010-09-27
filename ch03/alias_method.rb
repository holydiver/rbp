# Define a method
class Foo
  def bar
    "baz"
  end
end

f = Foo.new
puts f.bar #=> "baz"

# Set up an alias
class Foo
  alias_method :kittens, :bar
end

puts f.kittens #=> "baz"

# redefine the original method
class Foo
  def bar
    "Dog"
  end
end

puts f.bar     #=> "Dog"
puts f.kittens #=> "baz"
