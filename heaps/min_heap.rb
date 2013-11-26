
require 'heap.rb'

class MinHeap
  include HeapOperations

  def initialize
    @items = []
  end

  def add(item)
    @items << item
    bubble_up(@items.length - 1)
  end

  def pop_min
    if min = @items.delete_at(0)
      if @items.insert(0, @items.pop)[0]
        bubble_down(0)
      end
    end

    min
  end

private
  def bubble_up(i)
    return if parentof(i) == -1

    if @items[parentof(i)] > @items[i]
      swap_items(i, parentof(i))
      bubble_up(parentof(i))
    end
  end

  def bubble_down(i)
    return unless @items[youngchildof(i)]
    
    if @items[oldchildof(i)] and @items[oldchildof(i)] < @items[youngchildof(i)]
      min_child = oldchildof(i)
    else
      min_child = youngchildof(i)
    end

    if @items[i] > @items[min_child]
      swap_items(i, min_child)
      bubble_down(min_child)
    end
  end

  def swap_items(i, j)
    @items[i], @items[j] = @items[j], @items[i]
  end
end
