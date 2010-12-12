class ApplicationController < HotCocoaApplicationController
  
  attr_accessor :chips
  
  def chips
    @chips ||= []
  end
  
  def application_view
    # puts "application_view exec"
    normal.render
  end
  
  # def application_window
  #   window :size => [640, 480], :center => true, :title => "Goodfet", :view => :nolayout, :style => [:titled, :closable, :miniaturizable, :resizable, :textured] do |win|
  #     # win << label(:text => "1....... from someone else", :layout => {:start => true})
  #     # win << label(:text => ".. 2  ...................... HotCocoa", :layout => {:start => false})
  #     # win << normal.render
  #     win.will_close { exit }
  #   end
  #   # display("normal")
  # end

end