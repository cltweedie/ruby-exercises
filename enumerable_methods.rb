# Rebuild some of the enumerable methods in Ruby

module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield i
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    self.my_each do |x|
      if yield(x)
        new_array << x
      end 
    end
    new_array
  end

  def my_all?
    new_array = []
    self.my_each do |x|
      if yield(x)
        new_array << x
      end 
    end
    new_array == self
  end

  def my_any?
    self.my_each do |x|
      if yield(x)
        return true
      end 
    end
    false
  end

  def my_none?
    self.my_each do |x|
      if yield(x)
        return false
      end 
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |x|
      if yield(x)
        count += 1
      end
    end
    count
  end

  def my_map
    new_array = []
    self.my_each do |x|
      new_array << yield(x)
    end
    new_array
  end

  def my_inject
    y = 0
    self.my_each do |x|
      y = yield(y,x)
    end
    y
  end

end



