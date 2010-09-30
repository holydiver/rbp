class Object
  class << self
    alias_method :blank_slate_method_added, :method_added

    # Detect method additions to Object and remove them in the
    # BlankSlate class.
    def method_added(name)
      result = blank_slate_method_added(name)
      return result if self != Object
      BlankSlate.hide(name)
      result
    end
  end
end
