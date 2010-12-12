class Normal < HotCocoaView

  def self.options
    # DefaultLayoutOptions = {:expand => [:width, :height]}
    # {:application => {:layout => }}
    {:window => {}}
  end
  # 
  def render
    split_view(:horizontal => false, :frame => [0,0,0,0], :divider_style => NSSplitViewDividerStyleThin, :layout => {:expand => [:width, :height]}) do |split|
      split << scroll_view(:layout => {:expand => [:width, :height]}) do |scroll|
        scroll.setAutohidesScrollers(true)
        scroll.horizontal_scroller = false
        
        scroll << @sources = source_list(:columns => [column(:id => :data, :title => 'test')], :data => [] ) do |table|
          # TODO: constant :selection_style, source_list
          table.setSelectionHighlightStyle(NSTableViewSelectionHighlightStyleSourceList)
          table.headerView = nil
          # table.setUsesAlternatingRowBackgroundColors(true)
          # table.setGridStyleMask(NSTableViewSolidHorizontalGridLineMask)                             
        end
      end
      
      split << scroll_view(:layout => {:expand => [:width, :height]}) do |scroll|
        scroll.setAutohidesScrollers(true)
        scroll.horizontal_scroller = false
        scroll << @table = table_view(:columns => [column(:id => :data, :title => '')], :data => []) do |table|
          table.setUsesAlternatingRowBackgroundColors(true)
          table.setGridStyleMask(NSTableViewSolidHorizontalGridLineMask)                             
        end
      end
    end
    
    # I need to call a method on the application window to set the position of the divider, can't to this here... Is there some place it returns to after the views are called?

    # self.set_position(180, :of_divider_at_index => 0)
    # layout.set_position(180, :of_divider_at_index => 0)
    
  end
end