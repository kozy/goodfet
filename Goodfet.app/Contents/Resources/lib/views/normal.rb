class Normal < HotCocoaView

  # def self.options
  #   {:application => {}}
  # end
  # 
  def render
    # puts "rendering"
    # @split = split_view(:horizontal => false, :frame => [0,0,50,50], :divider_style => NSSplitViewDividerStyleThin) do |split|
    #   split << scroll_view(:layout => {:expand => [:width, :height]}) do |scroll|
    #     scroll.setAutohidesScrollers(true)
    #     scroll.horizontal_scroller = false
    #     
    #     scroll << @sources = source_list(:columns => [column(:id => :data, :title => 'test')], :data => [] ) do |table|
    #       # TODO: constant :selection_style, source_list
    #       table.setSelectionHighlightStyle(NSTableViewSelectionHighlightStyleSourceList)
    #       table.headerView = nil
    #       # table.setUsesAlternatingRowBackgroundColors(true)
    #       # table.setGridStyleMask(NSTableViewSolidHorizontalGridLineMask)                             
    #     end
    #   end
    #   
    #   split << scroll_view(:layout => {:expand => [:width, :height]}) do |scroll|
    #     scroll.setAutohidesScrollers(true)
    #     scroll.horizontal_scroller = false
    #     scroll << @table = table_view(:columns => [column(:id => :data, :title => '')], :data => []) do |table|
    #       table.setUsesAlternatingRowBackgroundColors(true)
    #       table.setGridStyleMask(NSTableViewSolidHorizontalGridLineMask)                             
    #     end
    #   end
    # end
    # 
    # @split.set_position(180, :of_divider_at_index => 0)
    # @split
     label(:text => ".................................4......... from Normal", :layout => {:start => false})
  end
end