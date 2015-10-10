class HexagramScreenStylesheet < ApplicationStylesheet
  def margin; 12; end

  def root_view(st)
    st.background_color = color.off_white
  end

  def english_name(st)
    st.font = font.medium
    st.text_alignment = :center
    st.size_to_fit
    st.frame = { t: 78, centered: :horizontal }
  end

  def english_subtitle(st)
    st.font = font.small
    st.text_alignment = :center
    st.size_to_fit
    st.frame = { bp: 5, fr: margin * 2 }
  end

  def hexagram_view(st)
    dimension = 3 * ((device_width - margin * 3) / 4)
    st.frame = { t: 150, fr: margin, w: dimension, h: dimension }
  end

  def character_0(st)
    st.frame = { t: 150, l: margin, fr: st.prev_frame.width + margin * 2 }
    st.frame = { h: st.frame.width }
    st.font = font.at_80
    st.text_alignment = :center
  end

  def character_1(st)
    st.frame = { bp: 5, l: margin, w: st.prev_frame.width, h: st.prev_frame.height }
    st.font = font.at_80
    st.text_alignment = :center
  end

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

  def hexagram_text_view(st)
    st.background_color = color.cyan
    st.frame = { l: margin, w: device_width - margin * 2, h: device_height - 100, t: device_width + 50 }
  end
end
