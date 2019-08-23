require 'byebug'
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
    end

  def insert(num)
    if num < @store.length && num > 0
      @store[num] = true
      else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
      end
      return false
    end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num 
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num) 

  end

  # private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new } #instance variable 
    @count = 0
  end

  def insert(num) # instance method 
    # count += 1 if !self.include?(num)  # class instance method 

    
    if self.count > num_buckets - 1
      self.resize!
    end
    
    if !self.include?(num)  # class instance method 
      self.count += 1 # class instance method 
      self[num] << num
    end
  end

  def remove(num)
    if self.include?(num)
      self.count -= 1
      self[num].delete(num)
    end
  end

  def include?(num)
   self[num].include?(num)
  end

  # private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    store.each do |bucket|
      bucket.each do |ele|
      new_store[ele % new_store.length] << ele
      end
    end
    @store = new_store
    end
  #   old_bucket = @store.flatten 
  #   new_count = Array.new(num*2) {Array.new}
  #   new_count.map {|num| }
  #   if count = 20
  #     num_buckets * times
  #   end
  #   return num_buckets

end
