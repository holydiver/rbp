class TestClass
  class << self
    def class_method
      "I am a class method"
    end
  end
  def instance_method
    "I am an instance method"
  end
end
puts TestClass.class_method

class_instance = TestClass.new
puts class_instance.instance_method
puts class_instance.class_method
