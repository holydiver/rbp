def parse_afm(file_name)
  section = []

  File.foreach(file_name) do |line|
    case line
    when /^Start(\w+)/
      section.push $1
      next
    when /^End(\w+)/
      section.pop
      next
    end

    case section
    when ["FontMetrics", "CharMetrics"]
      parse_char_metrics(line)
    when ["FontMetrics", "KernData", "KernPairs"]
      parse_kern_pairs(line)
    when ["FontMetrics", "KernData", "TrackKern"], ["FontMetrics", "Composites"]
      next
    else
      parse_generic_afm_attribute(line)
    end
  end
end

def parse_char_metrics(line)
  if line =~ /^CH?\s/
    name                  = line[/\bn\s+(\.?\w+)\s*;/, 1]
    @glyph_widths[name]   = line[/\bwx\s+(\d+)\s*;/, 1].to_i
    @bounding_boxes[name] = line[/\bb\s+([^;]+);/, 1].to_s.rstrip
  end
end

def parse_kern_pairs(line)
  if line =~ /^KPX\s+(\.?\w+)\s+(\.?\w+)\s+(-?\d+)/
    @kern_pairs[[$1, $2]] = $3.to_i
  end
end
