# HotCocoa::Mappings.map :source_list => :PXSourceList do
HotCocoa::Mappings.map :source_list => :NSOutlineView do
  
  ['/source_list_delegate', '/source_list_data_source'].each do |path|
    require File.join(File.dirname(__FILE__), path)
  end
  
  defaults :column_resize => :uniform, :frame => DefaultEmptyRect, :layout => {}
  
  constant :column_resize, {
    :none               => NSTableViewNoColumnAutoresizing,
    :uniform            => NSTableViewUniformColumnAutoresizingStyle,
    :sequential         => NSTableViewSequentialColumnAutoresizingStyle,
    :reverse_sequential => NSTableViewReverseSequentialColumnAutoresizingStyle,
    :last_column_only   => NSTableViewLastColumnOnlyAutoresizingStyle,
    :first_column_only  => NSTableViewFirstColumnOnlyAutoresizingStyle
  }

  
  def init_with_options(outline_view, options)
    outline_view.initWithFrame(options.delete(:frame))
  end

  custom_methods do
    
    attr_accessor :pxdata_source
    
    def data=(data_source)
      @pxdata_source = HotCocoa::SourceListDataSource.new(data_source) if data_source.kind_of?(Array)
      setDataSource(@pxdata_source)
      setDelegate SourceListDelegate.new
      
      expand_always_expanded
    end
    
    def expand_always_expanded
      dataSource.outlineView(self, numberOfChildrenOfItem:nil).times do |group|
        item = dataSource.outlineView(self, child:group, ofItem:nil)
        expandItem(item, expandChildren:false) if isGroupAlwaysExpanded(item)
      end
    end

    def frameOfOutlineCellAtRow(row)
      # Return a zero-rect if the item is always expanded (a disclosure triangle will not be drawn)
      isGroupAlwaysExpanded(itemAtRow(row)) ? NSZeroRect : super(row)
    end
    
    def isGroupAlwaysExpanded(item)
      delegate.outlineView(self, isGroupItem:item) and item.has_key?(:always_expanded) # if delegate
    end

    def columns=(columns)
      columns.each do |column|
        addTableColumn(column)
      end
      setOutlineTableColumn(columns[0]) if outlineTableColumn.nil?
    end

    def column=(column)
      addTableColumn(column)
    end

    def reload
      reloadData
      expand_always_expanded
    end

    def on_double_action=(behavior)
      if target && (
          target.instance_variable_get("@action_behavior") ||
            target.instance_variable_get("@double_action_behavior"))
        object.instance_variable_set("@double_action_behavior", behavior)
        object = target

      else
        object = Object.new
        object.instance_variable_set("@double_action_behavior", behavior)
        setTarget(object)
      end

      def object.perform_double_action(sender)
        @double_action_behavior.call(sender)
      end
      setDoubleAction("perform_double_action:")
    end

    def on_double_action(&behavior)
      self.on_double_action = behavior
      self
    end
  end
end
