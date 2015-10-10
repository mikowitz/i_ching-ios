class HexagramLineView < UIView
  def draw_line_segments(line_type)
    case line_type.to_i
    when 0 then draw_broken_line
    when 1 then draw_full_line
    end
  end

  def draw_full_line
    rmq(self).append!(UIView, :hexagram_line_segment).style do |st|
      st.frame = { t: 0, l: 0, h: self.frame.size.height, w: self.frame.size.width }
    end
  end

  def draw_broken_line
    rmq(self).append!(UIView, :hexagram_line_segment).style do |st|
      st.frame = { t: 0, l: 0, h: self.frame.size.height, w: (8 * self.frame.size.width / 22) }
    end
    rmq(self).append!(UIView, :hexagram_line_segment).style do |st|
      st.frame = { t: 0, fr: 0, h: self.frame.size.height, w: (8 * self.frame.size.width / 22) }
    end
  end
end
