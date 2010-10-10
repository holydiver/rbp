require File.dirname(__FILE__) + '/memoizable'

include Memoizable

@series = []

def fib(n)
  @series[n] = n if (0..1).include? n
  @series[n] ||= fib(n-1) + fib(n-2)
end

def rgb2hex(rgb)
  rgb.map { |e| "%02x" % e }.join
end

memoize :rgb2hex

def hex2rgb(hex)
  r,g,b = hex[0..1], hex[2..3], hex[4..5]
  [r,g,b].map { |e| e.to_i(16) }
end

memoize :hex2rgb

def rgb2hex_manual_cache(rgb)
  @rgb2hex ||= Hash.new do |colors, value| 
    colors[value] = value.map { |e| "%02x" % e }.join
  end

  @rgb2hex[rgb]
end

def hex2rgb_manual_cache(hex)
  @hex2rgb ||= Hash.new do |colors, value|
    r,g,b = value[0..1], value[2..3], value[4..5]
    colors[value] = [r,g,b].map { |e| e.to_i(16) }
  end

  @hex2rgb[hex]
end
