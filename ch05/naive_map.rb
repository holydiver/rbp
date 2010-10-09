require 'benchmark'

def naive_map(array, &block)
  new_array = []
  array.each { |e| new_array << block.call(e) }
  return new_array
end

def naive_map_recursive(array, &block)
  return [] if array.empty?
  [ yield(array[0]) ] + naive_map_recursive(array[1..-1], &block)
end

def naive_map_via_inject(array, &block)
  array.inject([]) { |s,e| [ yield(e) ] + s }
end

N = 100_000

Benchmark.bmbm do |x|
  a = [1,2,3,4,5] * 20

  x.report("naive map") do
    N.times { naive_map(a) { |i| i + 1 } }
  end

  x.report("naive map recursive") do
    N.times { naive_map_recursive(a) { |i| i + 1 } }
  end

  x.report("naive map via inject") do
    N.times { naive_map_via_inject(a) { |i| i + 1 } }
  end
end
