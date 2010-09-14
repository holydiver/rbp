require 'minitest/unit'
require '/home/enrique/rubys/book_code/rbp/test_unit_extensions'
require '/home/enrique/rubys/book_code/rbp/ch01/questioner'
require 'stringio'

class QuestionerTest < Test::Unit::TestCase

  def setup
    @input = StringIO.new
    @output = StringIO.new
    @questioner = Questioner.new(@input, @output)
    @question = "Are you happy?"
  end

  ["y", "Y", "YeS", "YES", "yes"].each do |y|
    must "return true when parsing #{y}" do
      provide_input(y)
      assert @questioner.ask(@question), "Expected '#{y}' to be true"
      expect_output "#{@question}\n" 
    end
  end

  %w[n N no nO].each do |no|
    must "return false when parsing #{no}" do
      provide_input(no)
      assert ! @questioner.ask(@question)
      expect_output "#{@question}\n"
    end
  end

  [["y", true], ["n", false]].each do |input, state| 
    must "continue to ask for input until given #{input}" do
      provide_input "Note\nYesterday\nxyzaty\n#{input}"
      assert_equal state, @questioner.ask(@question)
      expect_output "#{@question}\nI don't understand.\n"*3 + "#{@question}\n"
    end
  end

  def provide_input(string)
    @input << string
    @input.rewind
  end

  def expect_output(string)
    assert_equal string, @output.string
  end
end

