require 'byebug'

class LRUCache

  def initialize(cache_length)
    @cache = Array.new(cache_length)
    @length = cache_length
  end

  def count
    # returns number of elements currently in cache
    count = 0
    @cache.each { |el| count += 1 unless el.nil? }
    count
  end

  def add(el)
    # adds element to cache according to LRU principle
    index = @cache.index(el)
    if index
      shift_elements(index)
    else
      shift_elements(0)
    end
    @cache[@length - 1] = el

    self
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

  private
  # helper methods go here!
  def shift_elements(index)
    while index < @length - 1
      @cache[index] = @cache[index+1]
      index += 1
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  cache = LRUCache.new(4)
  debugger
  cache.add("I walk the line")
  cache.add(5)

  p cache.count # => returns 2

  cache.add([1,2,3])
  cache.add(5)
  cache.add(-5)
  cache.add({a: 1, b: 2, c: 3})
  cache.add([1,2,3,4])
  cache.add("I walk the line")
  cache.add(:ring_of_fire)
  cache.add("I walk the line")
  cache.add({a: 1, b: 2, c: 3})


  p cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end
