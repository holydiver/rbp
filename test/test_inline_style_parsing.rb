require 'minitest/unit'
require '/home/enrique/rubys/book_code/rbp/test_unit_extensions'
require '/home/enrique/rubys/book_code/rbp/ch01/prawn'

class TestInlineStyleParsing < Test::Unit::TestCase
  must "simply return the string if styles are not found" do
    @pdf = Prawn::Document.new
    assert_equal "Hello World", @pdf.parse_inline_styles("Hello World")
  end

  must "parse italic tags" do
    @pdf = Prawn::Document.new
    assert_equal ["Hello ", "<i>", "Fine", "</i>", " World"],
                  @pdf.parse_inline_styles("Hello <i>Fine</i> World")
  end

  must "parse bold tags" do
    @pdf = Prawn::Document.new
    assert_equal ["Some very ", "<b>", "bold text", "</b>"],
      @pdf.parse_inline_styles("Some very <b>bold text</b>")
  end

  must "parse mixed italic and bold tags" do
    @pdf = Prawn::Document.new
    assert_equal ["Hello ", "<i>", "Fine ", "<b>", "World", "</b>", "</i>"],
      @pdf.parse_inline_styles("Hello <i>Fine <b>World</b></i>")
  end
end
