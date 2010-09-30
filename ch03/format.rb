module Fatty
  class Formatter
    @@params = []
    @@formats = {}

    class << self
      def required_params(*params)
        @@params << params
      end

      def formats
        @@formats
      end

      def helper
        @@helper
      end

      def format(name, options = {}, &block)
        @@formats[name] = Class.new(options[:base] || Fatty::Format, &block)
      end

      def helpers(helper_module=nil, &block)
        @@helper = helper_module || Module.new(&block)
      end
    end

  end

  class Format
    def test456
      "Test method added before dynamic creation"
    end
  end
end

Fatty::Formatter.format :test do
  def test123
    "Message from dynamically created class"
  end 
end

formatter = Fatty::Formatter.new

formatter.class.helpers do
  def mixinmethod
    "Mixed in module method"
  end
end

new_class = Fatty::Formatter.formats[:test].new
new_class.extend(Fatty::Formatter.helper)
puts new_class.test123
puts new_class.test456
puts new_class.mixinmethod
