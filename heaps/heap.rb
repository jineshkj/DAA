
module HeapOperations
  def parentof(i)
    (i == 0) ? nil : (i-1)/2
  end
  
  def youngchildof(i)
    (2*i)+1
  end

  def oldchildof(i)
    youngchildof(i) + 1
  end
end

