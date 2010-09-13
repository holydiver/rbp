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

  must "not raise an error when a valid password is used" do
    assert_nothing_raised do
      @lock_box.unlock("secret")
    end
  end

  must "prevent access to content by default" do
    assert_raises(LockBox::UnauthorizedAccess) do
      @lock_box.content
    end
  end

  must "allow access to content when box is properly unlocked" do
    assert_nothing_raised do
      @lock_box.unlock("secret")
      @lock_box.content
    end
  end
end
