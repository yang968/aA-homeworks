class Map
  attr_accessor :array

  def initialize
    @array = []
  end

  def set(key, val)
    old = nil
    @array.each do |arr|
      if arr.first == key
        old = arr
        arr[1] = val
        break
      end
    end

    @array << [key, val] if old.nil?
  end

  def get(key)
    arr = @array.select { |el| el[0] == key }
    arr.last
  end

  def delete(key)
    @array.reject { |el| el[0] == key }
  end

  def show
    @array
  end
end
