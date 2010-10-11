module EvenSeries
  class Node
    def initialize(number=0)
      @value = number
      @next  = lambda { Node.new(number + 2) }
    end

    attr_reader :value

    def next
      @next.call
    end
  end
end

e = EvenSeries::Node.new(30)
10.times do
  p e.value
  e = e.next
end
