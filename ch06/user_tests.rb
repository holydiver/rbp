require 'test/unit'
require File.dirname(__FILE__) + '/user'

class UserTest < Test::Unit::TestCase
  def setup
    @student = User.new
  end

  def test_a_new_applicant_cannot_renew
    assert_block("Expected User#can_renew? to be false for a new applicant") do
      not @student.can_renew?
    end
  end

  def test_a_user_with_pending_applications_cannot_renew
    @student.applications << app(:accepted) << app(:pending)
    msg = "Expected User@can_renew? to be false when user has pending applications"
    assert_block(msg) do
      not @student.can_renew?
    end
  end

  def test_a_user_with_only_accepted_and_rejected_applications_can_renew
    @student.applications << app(:accepted) << app(:rejected) << app(:accepted)
    msg = "Expected User#can_renew? to be true when all applications " +
        "are accepted or rejected"
    assert_block(msg) { @student.can_renew? }
  end

  private

  def app(state)
    Application.new(state)
  end
end

