class LRUCache

  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      @cache << el
      @cache.shift
    else
      @cache << el
    end
    # adds element to cache according to LRU principle
  end

  def show
    p @cache 
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
