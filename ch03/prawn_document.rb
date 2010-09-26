class Prawn::Document
  def self.generate(file, *args, &block)
    pdf = Prawn::Document.new(*args)
    block.arity < 1 ? pdf.instance_eval(&block) : block.call(pdf)
    pdf.render_file(file)
  end

  # Provide the following shortcuts:
  #
  #   stroke_some_method(*args) #=> some_method(*args); stroke
  #   fill_some_method(*args) #=> some_method(*args); fill
  #   fill_and_stroke_some_method(*args) #=> some_method(*args); fill_and_stroke
  #
  def method_missing(id,*args,&block)
    case(id.to_s)
    when /^fill_and_stroke_(.*)/
      send($1,*args,&block); fill_and_stroke
    when /^stroke_(.*)/
      send($1,*args,&block); stroke
    when /^fill_(.*)/
      send($1,*args,&block); fill
    else
      super
    end
  end
end

Prawn::Document.generate("shapes.pdf") do
  fill_color "ff0000"
  # Fills a red circle
  circle_at [100, 100], :radius => 25
  fill

  # Strokes a transparent circle with a black border and a line extending
  # from its center point
  circle_at [300, 300], :radius => 50
  line [300, 300], [350, 300]
  stroke

  # Fills and strokes a red hexagon with a black border
  polygon [100, 250], [200, 300], [300, 250],
          [300, 150], [200, 100], [100, 150]
  fill_and_stroke
end
