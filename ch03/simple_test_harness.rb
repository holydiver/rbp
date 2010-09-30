class SimpleTestHarness

  class << self

    def inherited(base)
      tests << base
    end

    def tests
      @tests ||= []
    end

    def run
      tests.each do |t|
        t.instance_methods.grep(/^test_/).each do |m|
          test_case = t.new
          test_case.setup if test_case.respond_to?(:setup)
          test_case.send(m)
        end
      end
    end
  end
end
