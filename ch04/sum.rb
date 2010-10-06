sum = 0
File.foreach("data.txt") { |line| sum += line[/total: (\d+)/,1].to_f }

puts sum

sum = 0
enum = File.foreach("data.txt")
sum = enum.inject(0) { |s,r| s + r[/total: (\d+)/,1].to_f }

puts sum
