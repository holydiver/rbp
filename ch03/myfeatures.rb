module MyFeatures
  
  module ClassMethods
    def say_hello
      "Hello"
    end

    def say_goodbye
      "Goodbye"
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def say_hello
    "Hello from #{self}"
  end

  def say_goodbye
    "Goodbye from #{self}"
  end
end

class A
  include MyFeatures
end
