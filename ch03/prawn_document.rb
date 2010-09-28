class Prawn
  class Document
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

    def font_size(size = nil)
      return @font_size unless size
      @font_size = size
    end

    alias_method :font_size=, :font_size
  end

  class FattyFormat
  end
end
