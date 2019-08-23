class HashSet
  attr_reader :count, :store
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.count > num_buckets - 1
      self.resize!
    end
    
    if !self.include?(key)  # class instance method 
      self.count += 1 # class instance method 
      self[key] << key
    end
  end

  def include?(key)
   return true if self[key].include?(key)
   false
  end

  def remove(key)
    if self.include?(key)
      self.count -= 1
      self[num].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]   
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

end
