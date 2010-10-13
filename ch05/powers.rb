require File.expand_path(File.dirname(__FILE__)) + "/../lazy_stream"

class Powers < LazyStream::Node
  def initialize(of, start = 1)
    super(start) { self.class.new(of, start * of) }
  end
end

powers_of_two = Powers.new(2)
powers_of_two.show(10) # => 1 2 4 8 16 32 64 128 256 512
