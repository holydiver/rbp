require File.dirname(__FILE__) + '/' + 'naivelazy'

class Cell
  FONT_HEIGHT = 10
  FONT_WIDTH  = 8

  def initialize(text)
    @text = text
    @width = NaiveLazy::Promise.new { calculate_width }
    @height = NaiveLazy::Promise.new { calculate_height }
  end

  attr_accessor :text, :width, :height

  def to_s
    "Cell(#{width}x#{height})"
  end

  private
  
  def calculate_height
    @text.lines.count * FONT_HEIGHT
  end
  
  def calculate_width
    @text.lines.map { |e| e.length }.max  * FONT_WIDTH
  end
end

