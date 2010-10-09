module A
  extend self

  def foo
    "This is foo calling baz: #{baz}"
  end

  def bar
    "This is bar"
  end

  private
  
  def baz
    "hi there"
  end
end
