class Map
  attr_accessor :array

  def initialize
    @array = []
  end

  def set(key, val)
    idx = find_index(key)

    (idx.nil? ? @array << [key, val] : @array[idx].last = val)
  end

  def get(key)
    idx = find_index(key)

    (idx.nil? nil : @array[idx].last)
  end

  def find_index(key)
    idx
    @array.each_index { |i| idx = i if @array[i].first == key}
  end

  def delete(key)
    @array.reject { |el| el[0] == key }
  end

  def show
    @array
  end
end
