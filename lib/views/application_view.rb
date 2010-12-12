class ApplicationView < HotCocoaView
    
  def self.options
    {
      :application => {:name => "Goodfet"}, 
      :window => {
        # :frame => [0, 0, 640, 480],
        :size => [640, 480], 
        :center => true, 
        :title => "Goodfet", 
        :style => [:titled, :closable, :miniaturizable, :resizable, :textured]
      }
    }
  end
  
  # what should this do exactly, the output value of this is not getting in the window unless I specifically reach out and put it there,
  # currently, as it is, it also seems to create another window. I guess the (or this) view(s) are rendered before the controller is called.
  
  def render
    write_item = toolbar_item(:label => "Write", :image => image(icon_path("187-pencil")))
    
    read_item = toolbar_item(:label => "Read", :image => image(icon_path("57-download")))
    read_item.on_action { connect_serial }
    
    reset_item = toolbar_item(:label => "Reset", :image => image(icon_path("01-refresh")))
    
    expert_view_item = toolbar_item(:label => "Expert view") do |ev|
      ev.view = button(:title => "Expert", :bezel => :textured_rounded, :type => :push_on_push_off )
    end
    
    debug_item = toolbar_item(:label => "Debug console", :image => image(:named => "NSActionTemplate"))
    debug_item.on_action { connect_serial }
    
    # search_item = toolbar_item(:identifier => "Search") do |si|
    #   search = search_field(:frame => [0, 0, 150, 30], :layout => {:align => :right, :start => false})
    #   search.on_action { |sender| filter_instances(search) }
    #   si.view = search
    # end
    
    tbar = toolbar(:default => [read_item, write_item, reset_item, debug_item, :flexible_space, expert_view_item]) 
    
    # TODO: someone please tell me how where I go wrong:
    HotCocoaApplication.instance.controllers[:application_controller].application_window.toolbar = tbar
  end
  
  def icon_path(item)
    {:file => File.join(APP_ROOT, '../resources/icons/' + item + ".png")}
  end
  
end