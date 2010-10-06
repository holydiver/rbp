keys = []
values = []

File.open("foo.txt") do |file|
  file.each do |line|
    (file.lineno.odd? ? keys : values) << line.chomp
  end
end

puts Hash[*keys.zip(values).flatten]
