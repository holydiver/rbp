module Prawn
  class Document
    def parse_inline_styles(text)
      segments = text.split( %r{(</?.*?>)} ).reject { |x| x.empty? }
      segments.size == 1 ? segments.first : segments
    end
  end
end
