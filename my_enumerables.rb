module Enumerable

  def my_all?
    if block_given?
      self.my_each do |num|
        return false unless yield(num)
      end
      return true  
    end
  end

  def my_any?
    if block_given?
      self.my_each do |num|
        return true if yield(num)
      end
      return false
    end
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |num|
        if yield(num)
          count += 1
        end
      end
      return count
    end
    self.size
  end

  def my_each_with_index
    i = 0
    if block_given?
      while self.length > i
        yield self[i], i 
        i += 1
      end
    end
    self
  end

  def my_inject(initial_value)
    sum = initial_value
      self.my_each do |value|
        sum = yield sum, value
      end
    return sum
  end

  def my_map
    arr = []
    if block_given?
      self.my_each do |num|
        arr.push(yield(num))
      end
      arr
    end
  end

  def my_none?
    if block_given?
      self.my_each do |num|
        return false if yield(num)
      end
      true
    end
  end

  def my_select
    arr = []
    if block_given?
      self.my_each do |num|
        arr.push(num) if yield(num)
      end
      arr
    end 
  end  


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    i = 0
    if block_given?
      while self.length > i
        yield(self[i])
        i += 1
      end
    end
    self
  end

end

