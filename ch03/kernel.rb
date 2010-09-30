require 'blankslate'

module Kernel
  class << self
    alias_method :blank_slate_method_added, :method_added

    # Detect method additions to Kernel and remove them in the
    # BlankSlate class.
    def method_added(name)
      result = blank_slate_method_added(name)
      return result if self != Kernel
      BlankSlate.hide(name)
      result
    end

  end
  ##
  # The Kernel#require from before RubyGems was loaded.

  alias_method :gem_original_require, :require

  def require(path) # :doc:
    gem_original_require path
  rescue LoadError => load_error
    if load_error.message =~ /#{Regexp.escape path}\z/ and
       spec = Gem.searcher.find(path) then
       Gem.activate(spec.name, "= #{spec.version}")
       gem_original_require path
    else
      raise load_error
    end
  end
end
