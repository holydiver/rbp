def Mystery(secret)
  if secret == "chunky bacon"
    Class.new do
      def message
        "You rule!"
      end
    end
  else
    Class.new do
      def message
        "Don't make me cry"
      end
    end
  end
end

class Win < Mystery "chunky bacon"
  def who_am_i
    "I am win!"
  end
end

class EpicFail < Mystery "smooth ham"
  def who_am_i
    "I am teh fail"
  end
end

a = Win.new
puts a.message
puts a.who_am_i

b = EpicFail.new
puts b.message
puts b.who_am_i

