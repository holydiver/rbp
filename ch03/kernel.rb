module Kernel
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
