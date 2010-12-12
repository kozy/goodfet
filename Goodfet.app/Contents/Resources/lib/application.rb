require 'rubygems'
require 'hotcocoa'; include HotCocoa
require 'hotcocoa/mvc'

# require 'hotcocoa/mappings/appkit/outline_view'

# puts "files: #{__FILE__}"
# Dir.glob(File.join("./", 'vendor', '**', '*.rb')).each do |vendor_file|
#   # load(vendor_file)
#   puts vendor_file.inspect
#   require vendor_file
# end

APP_ROOT = File.dirname(File.expand_path(__FILE__))

require APP_ROOT + '/vendor/source_list/source_list'

HotCocoaApplication.new(__FILE__).start




# class Application < HotCocoaApplication
#   
#   # attr_accessor :chips
#   # 
#   # def chips
#   #   @chips ||= []
#   # end
#   
#   # def start
#   #   # Application.new(__FILE__).start
#   #   # application :name => "Goodfet" do |app|
#   #   #   app.delegate = self
#   #   #   @application_window = window :frame => [100, 100, 500, 500], :title => "Goodfet" do |win|
#   #   #     win << segment_control
#   #   #     win.will_close { exit }
#   #   #   end
#   #   #   
#   #   #   # display("AccountSetupView")
#   #   #   
#   #   # end
#   # end
#   
# 
# end

