# Does nothing but have not looked in to it too much yet. Not my biggest problem so far.

class MenuController < HotCocoaController

  # file/open
  def on_open(menu)
    puts "open"
  end

  # file/new 
  def on_new(menu)
  end

  # help menu item
  def on_help(menu)
  end

  # This is commented out, so the minimize menu item is disabled
  #def on_minimize(menu)
  #end

  # window/zoom
  def on_zoom(menu)
  end

  # window/bring_all_to_front
  def on_bring_all_to_front(menu)
  end

end