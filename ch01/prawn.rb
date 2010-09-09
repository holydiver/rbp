module Prawn
  class Document
    def parse_inline_styles(text)
      segments = text.split( %r{(</?[ib]>)} ).delete_if { |x| x.empty? }
      segments.size == 1 ? segments.first : segments
    end
  end
end
