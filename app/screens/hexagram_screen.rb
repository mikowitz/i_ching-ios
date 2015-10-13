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
    append!(HexagramTextView, :hexagram_text_view).tap do |q|
      q.data_source = self
      q.draw_contents
    end.on(:swipe_up) do |q|
      rmq.animate(
        duration: 0.5,
        animations: -> {
          rmq(:hexagram_text_view).style do |st|
            st.frame = { fb: 10 }
          end
          rmq(:hexagram_view).style do |st|
            st.scale = 0.65
            st.frame = { fr: rmq.stylesheet.margin, t: 150 }
          end
        }
      )
    end.on(:swipe_down) do |q|
      rmq.animate(
        duration: 0.5,
        animations: -> {
          rmq(:hexagram_text_view).style do |st|
            st.frame = { t: rmq.stylesheet.device_width + 50 }
          end
          rmq(:hexagram_view).style do |st|
            st.scale = 1.0
            st.frame = { fr: rmq.stylesheet.margin, t: 150 }
          end
        }
      )
    end
  end

  def text_view_contents
    [
      hexagram.judgement,
      hexagram.image
    ]
  end
end
