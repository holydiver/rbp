Application = Struct.new(:state)

class User
  def initialize
    @applications = []
  end

  attr_reader :applications

  def can_renew?
    return false if applications.empty?
    applications.all? { |e| [:accepted, :rejected].include?(e.state) }
  end
end

#student = User.new
#student.applications << Application.new(:accepted)
#student.applications << Application.new(:rejected)

#if student.can_renew?
#  puts "Start the application renewal process"
#else
#  puts "Edit a pending application or submit a new one"
#end
