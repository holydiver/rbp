module Prawn
  class Document
    def parse_inline_styles(text)
      text.split( %r{(</?[ib]>)} ).delete_if { |x| x.empty? }
    end
  end
end
