require File.expand_path(File.dirname(__FILE__)) + "/../lazy_stream"

def upto( from, to )
  return if from > to
  lazy_stream(from) { upto(from + 1, to) }
end
upto(3,6).show # => 3 4 5 6

def upfrom( start )
  lazy_stream(start) { upfrom(start + 1) }
end

upfrom(7).show(10) # => 7 8 9 10 11 12 13 14 15 16
