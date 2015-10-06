class AppDelegate
  def load_table_screen
    SDStatusBarManager.sharedInstance.enableOverrides
    SDStatusBarManager.sharedInstance.timeString = "2:00 PM"

    Api.fetch_hexagrams do |hexagrams|
      hexagrams.each do |hexagram|
        Hexagram.from_json(hexagram)
      end
      open HexagramTableScreen.new(nav_bar: true)
    end
  end
end
