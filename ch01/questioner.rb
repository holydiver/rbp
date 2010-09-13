class Questioner

  def inquire_about_happiness
    ask("Are you happy?") ? "Good I'm Glad" : "That's Too Bad"
  end

  def ask(question)
    puts question
    response = yes_or_no(gets.chomp)
    response.nil? ? ask(question) : response
  end

   def yes_or_no(response)
     case(response)
     when /^y(es)?$/i
       true
     when /^no?$/i
       false
     end
   end
end
