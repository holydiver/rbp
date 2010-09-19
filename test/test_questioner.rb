require File.join(File.expand_path(File.dirname(__FILE__)), 'test_helpers')
require '/home/enrique/rubys/book_code/rbp/ch01/questioner'

class QuestionerTest < Test::Unit::TestCase

  def setup
    @input = flexmock("input") 
    @output = flexmock("output")
    @questioner = Questioner.new(@input, @output)
    @question = "Are you happy?"
  end

  ["y", "Y", "YeS", "YES", "yes"].each do |y|
    must "return true when parsing #{y}" do
      expect_output @question
      provide_input(y)
      assert @questioner.ask(@question), "Expected '#{y}' to be true"
    end
  end

  %w[n N no nO].each do |no|
    must "return false when parsing #{no}" do
      expect_output @question
      provide_input(no)
      assert ! @questioner.ask(@question)
    end
  end

  [["y", true], ["n", false]].each do |input, state| 
    must "continue to ask for input until given #{input}" do
      %w[Yesterday North kittens].each do |i|
        expect_output @question
        provide_input(i)
        expect_output("I don't understand.")
      end

      expect_output @question
      provide_input input 
      assert_equal state, @questioner.ask(@question)
    end
  end

  def provide_input(string)
    @input.should_receive(:gets => string).once
  end

  def expect_output(string)
    @output.should_receive(:puts).with(string).once
  end
end
