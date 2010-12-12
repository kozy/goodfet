class SourceListDelegate

  def outlineView(view, isGroupItem:item)
    view.levelForItem(item) == 0
  end

  def outlineView(view, shouldSelectItem:item)
    not item.has_key?(:childRows)
  end

  def outlineView(view, shouldCollapseItem:item)
    not item.has_key?(:always_expanded)
  end
  
end