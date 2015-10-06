class AppDelegate < PM::Delegate
  include CDQ # Remove this if you aren't using CDQ

  status_bar true, animation: :fade

  # Without this, settings in StandardAppearance will not be correctly applied
  # Remove this if you aren't using StandardAppearance
  ApplicationStylesheet.new(nil).application_setup

  def on_load(app, options)
    cdq.setup # Remove this if you aren't using CDQ

    load_table_screen
  end

  def load_table_screen
    if Turnkey.unarchive("fetched-from-api-version") == Settings.current_api_version
      open HexagramTableScreen.new(nav_bar: true)
    else
      Api.fetch_hexagrams do |hexagrams|
        hexagrams.each do |hexagram|
          Hexagram.from_json(hexagram)
        end
        open HexagramTableScreen.new(nav_bar: true)
      end
    end
  end

  # Remove this if you are only supporting portrait
  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end
end
