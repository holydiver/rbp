require File.expand_path(File.dirname(__FILE__)) + "/../lazy_stream"

class Upto < LazyStream::Node
  def initialize(from, to)
    if from > to
      super(nil, &nil)
    else
      super(from) { self.class.new(from + 1, to) }
    end
  end
end
Upto.new(3, 6).show # => 3 4 5 6

class Upfrom < LazyStream::Node
  def initialize(from)
    super(from) { self.class.new(from + 1) }
  end
end
Upfrom.new(7).show(10) # => 7 8 9 10 11 12 13 14 15 16
