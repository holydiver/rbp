require 'benchmark'
require File.dirname(__FILE__) + '/' + 'memoization'

N = 500_000
m = Memoization.new

Benchmark.bmbm do |x|

  x.report("rgb2hex_uncached") do
    N.times { m.rgb2hex([100,25,50]) }
  end
  x.report("rgb2hex_manual_cache") do
    N.times { m.rgb2hex_manual_cache([100,25,50]) }
  end
  x.report("hex2rgb_uncached") do
    N.times { m.hex2rgb("beaded") }
  end
  x.report("hex2rgb_manual_cache") do
    N.times { m.hex2rgb_manual_cache("beaded") }
  end

end
