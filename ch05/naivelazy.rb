module NaiveLazy
  class Promise < BasicObject
    
    def initialize(&computation)
      @computation = computation
    end

    def __result__
      if @computation
        @result      = @computation.call
        @computation = nil
      end
      
      @result
    end

    def inspect
      if @computation
        "#<NaiveLazy::Promise computation=#{ @computation.inspect }>"
      else
        @result.inspect
      end
    end

    def respond_to?(message)
      message = message.to_sym
      [:__result__, :inspect].include?(message) or 
        __result__.respond_to? message
    end

    def method_missing(*a, &b)
      __result__.__send__(*a, &b)
    end
  end
end
