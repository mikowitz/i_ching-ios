class HexagramView < UIView
  LINE_POSITIONS = [ 21, 17, 13, 9, 5, 1 ]

  attr_accessor :dim, :delegate

  def draw_lines
    @dim = frame.size.width / 24.0
    LINE_POSITIONS.map { |l| l * @dim }.zip(delegate.lines).each do |position, line|
      append!(HexagramLineView, :hexagram_line).style do |st|
        st.frame = { w: @dim * 22, centered: :horizontal, h: @dim * 2, l: @dim, t: position }
      end.get.tap do |hexagram_line_view|
        hexagram_line_view.draw_line_segments(line)
      end
    end
  end
end
