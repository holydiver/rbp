a = lambda { File.read("foo.txt") }

b = a.call

puts b
