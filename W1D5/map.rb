class Map
  attr_accessor :array

  def initialize
    @array = []
  end

  def set(key, val)
    idx = find_index(key)
    arr = [key, val]
    (idx.nil? ? @array.push(arr) : @array[idx][1] = val)
  end

  def get(key)
    idx = find_index(key)

    (idx.nil? ? nil : @array[idx].last)
  end

  def find_index(key)
    idx = nil
    @array.each_index do |i|
      idx = i if @array[i].first == key
    end
    idx
  end

  def delete(key)
    @array.reject! { |el| el[0] == key }
  end

  def show
    @array
  end
end
