module Fatty
  class Formatter
    @@params = []
    @@formats = {}

    class << self
      def required_params(*params)
        @@params << params
      end

      def format(name, options = {}, &block)
        @@formats[name] = Class.new(options[:base] || Fatty::Format, &block)
      end

      def helpers(helper_module=nil, &block)
        @@helpers = helper_module || Module.new(&block)
      end
    end

  end

  class Format
    def test456
      "Test method added before dynamic creation"
    end
  end
end
