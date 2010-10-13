require File.expand_path(File.dirname(__FILE__)) + "/../lazy_stream"

def letters(letter)
  lazy_stream(letter) { letters(letter.succ) }
end

letters("a").filter(/[aeiou]/).show(10)          # => a e i o u aa ab ac ad ae
letters("a").filter { |l| l.size == 2 }.show(3)  # => aa ab ac

letters("a").transform { |l| l + "..." }.show(3) # => a... b... c...
