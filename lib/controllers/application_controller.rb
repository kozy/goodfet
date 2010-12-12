class ApplicationController < HotCocoaApplicationController
  
  attr_accessor :chips, :items
  
  def chips
    @chips ||= []
  end
    
  # When this method is left out, ApplicationView gets called but it is not '<<' it to the window. When you uncomment this the render method should be explicitly called.
  # I am not really sure what the ApplicationView is suppose to do. I guess the idea is that it's an overall template for the application, the  and that the other views will 
  # get
  
  # def application_view
  # 
  #   # puts HotCocoaApplication.instance.application_controller
  #   # puts "app window"
  #   # puts self.application_window.inspect
  #   
  #   # puts application_window.inspect
  #   normal.render
  # end
  
  # This is a similair method but for the application window. If you put settings in the view the window is created for you.
  
  # def application_window
  #   window :size => [640, 480], :center => true, :title => "Goodfet", :view => :nolayout, :style => [:titled, :closable, :miniaturizable, :resizable, :textured] do |win|
  #     win << label(:text => "1....... from someone else", :layout => {:start => true})
  #     win << label(:text => "1....... from someone else", :text_align => :center)
  #     
  #     # win << label(:text => ".. 2  ...................... HotCocoa", :layout => {:start => false})
  #     # win << normal.render
  #     win.will_close { exit }
  #   end
  #   # display("normal")
  # end
  
  # will get these from xml later and instantiate from models
  # def normal_view
  #   @items = [
  #     :data => "SX1231", 
  #     :always_expanded => true, 
  #     :childRows => [
  #       {:data => "Common"}, {:data => "Transmitter"}, {:data => "Reciever"}, {:data => "IRQ map"}, {:data => "Packet"}, {:data => "Temperature"}
  #     ]]
  # end

end