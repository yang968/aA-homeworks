def sluggish_octopus(arr)
  longest = ""

  arr.each_index do |i|
    longest = arr[i] if arr[i+1..-1].all? {|fish| fish.length < arr[i].length }
  end
  longest
end

def dominant_octopus(arr)
  prc = Proc.new{ |x, y| x <=> y }
  arr_sorted = merge_sort(arr, prc)
  arr_sorted.last
end

def merge_sort(arr, prc)
  return arr if arr.length <= 1

  middle = arr.length / 2
  left = merge_sort(arr[0...middle], prc)
  right = merge_sort(arr[middle..-1], prc)
  merge_helper(left, right, prc)
end

def merge_helper(left, right, prc)
  result = []

  until left.empty? || right.empty?
    case prc.call(left.first.length, right.first.length)
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end

  result + left + right
end

def clever_octopus(arr)
  longest = ""

  arr.each do |fish|
    longest = fish if fish.length > longest.length
  end

  longest
end

def slow_dance(direction, tiles)
  leg = 0
  i = 0
  while i < tiles.length
    leg = i if direction == tiles[i]
    i += 1
  end
  leg
end

def fast_dance(direction, tiles)
  tiles[direction]
end

if __FILE__ == $PROGRAM_NAME
  fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  p sluggish_octopus(fish_arr)
  p dominant_octopus(fish_arr)
  p clever_octopus(fish_arr)

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]
  p slow_dance("up", tiles_array)

  new_tiles_data_structure = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  p fast_dance("right-down", new_tiles_data_structure)
end
