class SortedList

  include Enumerable

  def initialize
    @data = []
  end

  def <<(element)
    (@data << element).sort!
  end

  def each
    @data.each { |e| yield(e) }
  end

  def report(head)
    header = "#{head}\n#{'-'*head.length}"
    body = map{ |e| yield(e)}.join("\n") + "\n"
    footer = "This report was generated at #{Time.now}\n"

    [header, body, footer].join("\n")
  end
end
