class HexagramScreenStylesheet < ApplicationStylesheet
  include HexagramViewStylesheet

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

  def hexagram_text_view(st)
    st.background_color = color.clear
    st.frame = { l: margin, w: device_width - margin * 2, h: device_height / 2, t: device_width + 50 }
  end

  def text_segmented_control(st)
    st.frame = { t: 0, l: 0, w: st.superview.frame.size.width, h: 30 }
  end

  def hexagram_judgement_text(st)
    st.frame = { l: 10, w: st.superview.frame.size.width - 20 }
    st.number_of_lines = 0
  end

  def hexagram_image_text(st)
    st.frame = { l: 10, w: st.superview.frame.size.width - 20 }
    st.number_of_lines = 0
  end
end
