class Cell
  
  FONT_HEIGHT = 10
  FONT_WIDTH  = 8

  def initialize(text)
    @text = text
  end

  attr_accessor :text
  attr_writer :width, :height

  def width
    @width ||= calculate_width
  end

  def height
    @height ||= calculate_height
  end

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

