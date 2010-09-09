module Prawn
  class Document
    def parse_inline_styles(text)
      require 'strscan'
    
      sc = StringScanner.new(text)
      output = []
      last_pos = 0

      loop do
        if sc.scan_until(/<\/?[ib]>/)
          pre = sc.pre_match[last_pos..-1]
          output << pre unless pre.empty?
          output << sc.matched
          last_pos = sc.pos
        else
          output << sc.rest if sc.rest?
          break output
        end
      end

      output.length == 1 ? output.first : output
    end
  end
end
