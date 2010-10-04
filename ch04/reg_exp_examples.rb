array = ["James Gray", "James gray", "james gray", "james Gray"]

# Alteration "|" => Match one of a series of potential sequences
puts array.all? { |e| e.match(/James|james Gray|gray/) }

# Character class "[]"
puts array.all? { |e| e.match(/[jJ]ames [gG]ray/) }

# Match a four digit number
number = "1234"
puts number.match(/[0-9][0-9][0-9][0-9]/) 

# Use repetition to do same match as above
puts number.match(/[0-9]{4}/)

# Use special class built in 
puts number.match(/\d{4}/)

puts "matched" if "Mr. Enrique Temes".match(/Enrique Temes/)

phrases = ["Mr. Enrique Temes", "Mr. Enrique Temes is cool",
           "Enrique Temes is cool", "Enrique Temes"]

# \A anchor indicates to match if string begins with phrase
puts phrases.grep /\AEnrique Temes\b/

# \b anchor indicates a match if string contains phrase
puts phrases.grep /\bEnrique Temes\b/

# \A and \z anchors ensure that string matches an exact phrase
puts phrases.grep /\AEnrique Temes\z/

# * Quantifier indicates zero or more => always matches
puts "true" if "1234Foo"[/(\d*)Foo/, 1]
puts "true" if "xFoo"[/(\d*)Foo/, 1]

# + Quantifies indicates at least one
puts "true" if "xFoo"[/(\d+)Foo/, 1]

# ? Quantifier indicates zero or one, always matches
puts "Gregory"[/\bGreg(ory)?\b/]
puts "Greg"[/\bGreg(ory)?\b/]
puts "Gregor"[/\bGreg(ory)?\b/] 

# All quantifiers can be made non-greedy by appending the ?
puts "# x # y # z #"[/#(.*)#/,1]
puts "# x # y # z #"[/#(.*?)#/,1]
