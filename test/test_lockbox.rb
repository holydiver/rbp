require 'minitest/unit'
require '/home/enrique/rubys/book_code/rbp/test_unit_extensions'
require '/home/enrique/rubys/book_code/rbp/ch01/lockbox'


class LockBoxTest < Test::Unit::TestCase
  
  def setup
    @lock_box = LockBox.new(password: "secret", content: "My Secret Message")
  end

  must "raise an error when an invalid password is used" do
    assert_raises(LockBox::InvalidPassword) do
      @lock_box.unlock("kitten")
    end
  end
end
