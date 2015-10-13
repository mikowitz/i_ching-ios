class HexagramTextView < UIView
  attr_accessor :data_source

  def draw_contents
    rmq(self).tap do |q|
      @control = q.append!(UISegmentedControl, :text_segmented_control).tap do |control|
        headers.each_with_index do |header, index|
          control.insertSegmentWithTitle(header, atIndex: index, animated: true)
        end
        control.addTarget(self, action: :show_content, forControlEvents: UIControlEventValueChanged)
      end
    end
    rmq(self).tap do |q|
      q.append!(UILabel, :hexagram_judgement_text).style do |st|
        st.text = contents[0]
        st.resize_height_to_fit
        st.frame = { t: 40 }
      end
      q.append!(UILabel, :hexagram_image_text).style do |st|
        st.text = contents[1]
        st.resize_height_to_fit
        st.frame = { t: 40 }
      end
    end
    @control.setSelectedSegmentIndex(0)
    show_content
  end

  def show_content
    index = @control.selectedSegmentIndex
    if index == 0
      rmq(:hexagram_judgement_text).style do |st|
        st.opacity = 1.0
      end
      rmq(:hexagram_image_text).style do |st|
        st.opacity = 0.0
      end
    else
      rmq(:hexagram_judgement_text).style do |st|
        st.opacity = 0.0
      end
      rmq(:hexagram_image_text).style do |st|
        st.opacity = 1.0
      end
    end
  end


  def headers
    [
      "THE JUDGEMENT",
      "THE IMAGE"
    ]
  end

  def contents
    self.data_source.text_view_contents
  end
end
