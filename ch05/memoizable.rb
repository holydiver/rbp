module Memoizable
  def memoize( name, cache = Hash.new)
    original = "__original__#{name}"
    
    ([Class, Module].include?(self.class) ? self : self.class).class_eval do
      alias_method original, name
      private      original
      define_method(name) { |*args| cache[args] ||= send(original, *args) }
    end
  end
end
