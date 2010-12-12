module HotCocoa
  class SourceListDataSource
    
    attr_reader :data
    
    # prot = Protocol.protocolWithName(:PXSourceListDataSource)
    # conformsToProtocol prot
    
    # - (NSUInteger)sourceList:(PXSourceList*)sourceList numberOfChildrenOfItem:(id)item;
    # - (id)sourceList:(PXSourceList*)aSourceList child:(NSUInteger)index ofItem:(id)item;
    # - (id)sourceList:(PXSourceList*)aSourceList objectValueForItem:(id)item;
    # - (BOOL)sourceList:(PXSourceList*)aSourceList isItemExpandable:(id)item;
    # 
    # @optional
    # - (void)sourceList:(PXSourceList*)aSourceList setObjectValue:(id)object forItem:(id)item;
    # 
    # - (BOOL)sourceList:(PXSourceList*)aSourceList itemHasBadge:(id)item;
    # - (NSInteger)sourceList:(PXSourceList*)aSourceList badgeValueForItem:(id)item;
    # - (NSColor*)sourceList:(PXSourceList*)aSourceList badgeTextColorForItem:(id)item;
    # - (NSColor*)sourceList:(PXSourceList*)aSourceList badgeBackgroundColorForItem:(id)item;
    # 
    # - (BOOL)sourceList:(PXSourceList*)aSourceList itemHasIcon:(id)item;
    # - (NSImage*)sourceList:(PXSourceList*)aSourceList iconForItem:(id)item;
    # 
    # //The rest of these methods are basically "wrappers" for the NSOutlineViewDataSource methods
    # - (id)sourceList:(PXSourceList*)aSourceList itemForPersistentObject:(id)object;
    # - (id)sourceList:(PXSourceList*)aSourceList persistentObjectForItem:(id)item;
    # 
    # - (BOOL)sourceList:(PXSourceList*)aSourceList writeItems:(NSArray *)items toPasteboard:(NSPasteboard *)pboard;
    # - (NSDragOperation)sourceList:(PXSourceList*)sourceList validateDrop:(id < NSDraggingInfo >)info proposedItem:(id)item proposedChildIndex:(NSInteger)index;
    # - (BOOL)sourceList:(PXSourceList*)aSourceList acceptDrop:(id < NSDraggingInfo >)info item:(id)item childIndex:(NSInteger)index;
    # - (NSArray *)sourceList:(PXSourceList*)aSourceList namesOfPromisedFilesDroppedAtDestination:(NSURL *)dropDestination forDraggedItems:(NSArray *)items;



    def initialize(data)
      @data = data
    end
    
    def outlineView(view, numberOfChildrenOfItem:item)
      if item.nil?
        data.length
      else
        item[:childRows].length
      end
    end
    
    def outlineView(view, isItemExpandable:item)
      item.has_key?(:childRows) && item[:childRows].length > 0
    end
    
    def outlineView(view, child:child, ofItem:item)
      if item.nil?
        data[child]
      else
        item[:childRows][child]
      end
    end
    
    def outlineView(view, objectValueForTableColumn:column, byItem:item)
      item[column.identifier.intern]
    end
    
    # extend
    def outlineView(view, iconForItem:item)
      
    end
    
    def outlineView(view, itemHasIcon:item)
      
    end
    
    

    
    # def outlineView(view, expandItem:item, expandChildren:bool)
    #   puts "*"*100
    #   # item.has_key?(:childRows) && item[:childRows].length > 0
    #   true
    # end
    
    # - sourceList:numberOfChildrenOfItem:
    # - sourceList:child:ofItem:
    # - sourceList:objectValueForItem:
    # - sourceList:isItemExpandable:
    
    # - (NSUInteger)sourceList:(PXSourceList*)sourceList numberOfChildrenOfItem:(id)item;
    # def sourceList(view, numberOfChildrenOfItem:item)
    #   if item.nil?
    #     data.length
    #   else
    #     item[:childRows].length
    #   end
    # end
    # 
    # # - (BOOL)sourceList:(PXSourceList*)aSourceList isItemExpandable:(id)item;
    # def sourceList(view, isItemExpandable:item)
    #   item.has_key?(:childRows) && item[:childRows].length > 0
    # end
    # 
    # # - (id)sourceList:(PXSourceList*)aSourceList child:(NSUInteger)index ofItem:(id)item;
    # def sourceList(view, child:child, ofItem:item)
    #   if item.nil?
    #     data[child]
    #   else
    #     item[:childRows][child]
    #   end
    # end
    # 
    # # - (id)sourceList:(PXSourceList*)aSourceList objectValueForItem:(id)item;
    # def sourceList(view, objectValueForItem:item)
    #   puts "*"*100
    #   puts item.inspect
    #   item[column.identifier.intern]
    # end
  
  # def method_missing(*args)
  #   puts "method missing: \n"
  #   puts args.inspect
  #   puts "/ method missing \n "
  # end
  
  end
end