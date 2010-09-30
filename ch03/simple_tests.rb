require File.join(File.expand_path(File.dirname(__FILE__)), 'simple_test_harness')

class SimpleTest < SimpleTestHarness

  def setup
    puts "Setting up @string"
    @string = "Foo"
  end

  def test_string_must_be_foo
    answer = (@string == "Foo" ? "yes" : "no")
    puts "@string == 'Foo': " << answer
  end

  def test_string_must_be_bar
    answer = (@string == "bar" ? "yes" : "no")
    puts "@string == 'bar': " << answer
  end

end

class AnotherTest < SimpleTestHarness
  def test_another_lame_example
    puts "This got called, isn't that good enough?"
  end

  def helper_method
    puts "But you'll never see this"
  end

  def a_test_method
    puts "Or this"
  end

end

SimpleTestHarness.run
