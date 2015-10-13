module HexagramViewStylesheet
  def hexagram_line(st)
    st.background_color = color.clear
    st.corner_radius = 4
    st.clips_to_bounds = true
  end

  def hexagram_line_segment(st)
    st.background_color = color.off_black
    st.corner_radius = 4
    st.clips_to_bounds = true
  end
end
