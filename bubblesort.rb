class Bubblesort

  def self.sort(list)
    counter = 0
    swaps = 0
    until counter >= list.length-1
      list.each_index do |i|
        if (list[i] <=> list[i+1]) == 1
          list[i], list[i+1] = list[i+1], list[i]
          swaps += 1
        end
      end
      counter += 1
      break if swaps == 0
    end
    puts list
  end

  def self.sort_by(list)
    counter = 0
    swaps = 0
    until counter >= list.length-1
      list.each_index do |i|
        break if i >= list.length-1
        if yield(list[i], list[i+1]) == 1
          list[i], list[i+1] = list[i+1], list[i]
          swaps += 1
        end
      end
      counter += 1
      break if swaps == 0
    end
    puts list
  end

end

#Bubblesort.sort([430,6,3,8,5,1,7,2,3,6,4,1,1,7,8,43,5,6,2,643,6,3,2,43,5,65,57,45,7,6,56,9])

Bubblesort.sort_by(["hi","hello","hey"]) do |left,right|
  left.length <=> right.length
end
