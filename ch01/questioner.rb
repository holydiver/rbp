class Questioner

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

  def ask(question)
    @output.puts question
    response = @input.gets.chomp
    case(response)
    when /^y(es)?$/i
      true
    when /^no?$/i
      false
    else
      @output.puts "I don't understand."
      ask question
    end
  end
end
