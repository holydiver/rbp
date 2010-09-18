require 'test_helpers'
require '/home/enrique/rubys/book_code/rbp/ch01/prawn'

class TestInlineStyleParsing < Test::Unit::TestCase
  def setup
    @parser = Prawn::Document::Text::StyleParser
  end

  must "parse italic tags" do
    assert_equal ["Hello ", "<i>", "Fine", "</i>", " World"],
      @parser.process("Hello <i>Fine</i> World")
  end

  must "parse bold tags" do
    assert_equal ["Some very ", "<b>", "bold text", "</b>"],
      @parser.process("Some very <b>bold text</b>")
  end

  must "parse mixed italic and bold tags" do
    assert_equal ["Hello ", "<i>", "Fine ", "<b>", "World", "</b>", "</i>"],
      @parser.process("Hello <i>Fine <b>World</b></i>")
  end

  must "not split out other tags than <i>, <b>, </i>, </b>" do
    assert_equal ["Hello <indigo>Ch", "</b>", "arl", "</b>", "ie</indigo>"],
      @parser.process("Hello <indigo>Ch</b>arl</b>ie</indigo>")
  end
 
  must "be able to check wether a string needs to be parsed" do
    assert @parser.style_tag?("Hello <i>Fine</i> World")    
    assert !@parser.style_tag?("Hello World")
  end
end
