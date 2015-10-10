class HexagramScreen < PM::Screen
  attr_accessor :hexagram

  stylesheet HexagramScreenStylesheet

  def on_load
    self.title = hexagram.chinese_name
    add_name_label
    draw_hexagram
    add_characters
    add_text
  end

  def add_name_label
    append(UILabel, :english_name).style do |st|
      st.text = self.hexagram.english_name
    end.reapply_styles
    append(UILabel, :english_subtitle).style do |st|
      st.text = self.hexagram.english_subtitle
    end.reapply_styles
  end

  def draw_hexagram
    append!(HexagramView, :hexagram_view).tap do |hexagram_view|
      hexagram_view.delegate = self
      hexagram_view.draw_lines
    end
  end

  def add_characters
    hexagram.characters.size.times do |i|
      append!(UILabel, :"character_#{i}").tap { |label| label.text = self.hexagram.characters.split("")[i] }
    end
  end

  def lines
    hexagram.binary.split("")
  end

  def add_text
    append!(UIView, :hexagram_text_view).tap do |q|
      q.append!(UISegmentedControl, :text_segmented_control)
      q.append!(UILabel, :hexagram_judgement_text)
      q.append!(UILabel, :hexagram_image_text)
    end
  end
end
