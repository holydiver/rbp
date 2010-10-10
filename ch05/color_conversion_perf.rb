require 'benchmark'
require File.dirname(__FILE__) + '/memoization'

N = 500_000

Benchmark.bmbm do |x|
  x.report("rgb2hex (Memoizable)") do
    N.times { rgb2hex([100,25,50]) }
  end
  x.report("rgb2hex_uncached") do
    N.times { __original__rgb2hex([100,25,50]) }
  end
  x.report("rgb2hex_manual_cache") do
    N.times { rgb2hex_manual_cache([100,25,50]) }
  end
  x.report("hex2rgb (Memoizable)") do
    N.times { hex2rgb("beaded") }
  end
  x.report("hex2rgb_uncached") do
    N.times { __original__hex2rgb("beaded") }
  end
  x.report("hex2rgb_manual_cache") do
    N.times { hex2rgb_manual_cache("beaded") }
  end
end
