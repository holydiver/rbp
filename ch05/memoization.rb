class Memoization

  def initialize
    @series = []
  end

  def fib(n)
    @series[n] = n if (0..1).include? n
    @series[n] ||= fib(n-1) + fib(n-2)
  end
end
