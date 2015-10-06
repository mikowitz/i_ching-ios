class HexagramTableScreen < PM::TableScreen
  title "IChing"
  stylesheet HexagramTableScreenStylesheet

  def table_data
    [
      {
        cells: [
          {
            title: "Cast hexagram",
            action: :cast_hexagram
          }
        ]
      },
      {
        title: "Hexagrams",
        title_view_height: 50,
        cells: (1..64).map do |king_wen_number|
          if hexagram = Hexagram.find(king_wen_number)
            {
              title: hexagram.chinese_name,
              subtitle: hexagram.english_name,
              height: 60
            }
          end
        end
      }
    ]
  end

  def cast_hexagram
    mp "=====> cast_hexagram"
  end
end
