require File.expand_path(File.dirname(__FILE__)) + "/../lazy_stream"

class Step < LazyStream::Node
  def initialize(step, start = 1)
    super(start) { self.class.new(step, start + 1) }
  
    @step = step 
  end

  def next_group(count = 10)
    limit!(count).map { |i| i * @step }
  end
end

evens = Step.new(2)

puts "The first ten even numbers are:"
puts evens.next_group.join(" ") # => 2 4 6 8 10 12 14 16 18 20

puts
puts "The next ten even numbers are:"
puts evens.next_group.join(" ") # => 22 24 26 28 30 32 34 36 38 40

puts 
puts "The current index for future calculations is: "
puts evens.current # => 21

threes = Step.new(3)

puts
puts "The first ten multiples of 3 are"
puts threes.next_group.join(" ") # => 3 6 9 12 15 18 21 24 27 30

puts 
puts "The next ten are:"
puts threes.next_group.join(" ") # => 33 36 39 42 45 48 51 54 57 60

puts
puts "The current index for future calculations is:"
puts threes.current # => 21
