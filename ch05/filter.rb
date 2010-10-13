class Filter
  def initialize
    @constraints = []
  end

  def constraint(&block)
    @constraints << block
  end

  def to_proc
    lambda { |e| @constraints.all? { |fn| fn.call(e) } }
  end
end

filter = Filter.new
filter.constraint { |x| x > 10 }
filter.constraint { |x| x.even? }
filter.constraint { |x| x % 3 == 0 }

p (8..24).select(&filter) # => [12,18,24]

filter.constraint { |x| x % 4 == 0 }

p (8..24).select(&filter) # => [12,24]
