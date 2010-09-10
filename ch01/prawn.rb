module Prawn
  module Document
    module Text
      module StyleParser
        extend self

        TAG_PATTERN = %r{(</?[ib]>)}

        def process(text)
          text.split(TAG_PATTERN).delete_if { |x| x.empty? }
        end

        def style_tag?(text)
          !!(text =~ TAG_PATTERN)
        end
      end
    end
  end
end
