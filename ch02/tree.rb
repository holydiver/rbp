class Tree
 
  include Comparable
  
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def <=>(other_tree)
    age <=> other_tree.age
  end

end
