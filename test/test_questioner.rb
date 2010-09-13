require 'minitest/unit'
require 'flexmock/test_unit'
require '/home/enrique/rubys/book_code/rbp/test_unit_extensions'
require '/home/enrique/rubys/book_code/rbp/ch01/questioner'

class QuestionerTest < Test::Unit::TestCase

  def setup
    @questioner = Questioner.new
  end

  must "respond 'Good I'm Glad' when inquire_about_happiness gets 'yes'" do
    stubbed = flexmock(@questioner, :ask => true)
    assert_equal "Good I'm Glad", stubbed.inquire_about_happiness
  end

  must "respond 'That's Too Bad' when inquire_about_happiness gets 'no'" do
    stubbed = flexmock(@questioner, :ask => false)
    assert_equal "That's Too Bad", stubbed.inquire_about_happiness
  end

  %w[y Y YeS YES yes].each do |yes|
    must "return true when yes_or_no parses #{yes}" do
      assert @questioner.yes_or_no(yes), "#{yes.inspect} expected to parse as true"
    end
  end

  %w[n N no nO].each do |no|
    must "return false when yes_or_no parses #{no}" do
      assert ! @questioner.yes_or_no(no), "#{no.inspect} expected to parse as false"
    end
  end

  %w[Note Yesterday xyzaty].each do |mu|
    must "return nil because #{mu} is not a variant of 'yes' or 'no'" do
      assert_nil @questioner.yes_or_no(mu), "#{mu.inspect} expected to parse as nil"
    end
  end
end
