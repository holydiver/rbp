class Prawn::Document
  def self.generate(file, *args, &block)
    pdf = Prawn::Document.new(*args)
    block.arity < 1 ? pdf.instance_eval(&block) : block.call(pdf)
    pdf.render_file(file)
  end
end
