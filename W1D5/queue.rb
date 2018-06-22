class Queue
  attr_accessor :array
  def initialize
    @array = []
  end

  def enqueue(el)
    @array << el
  end

  def dequeue
    @array.shift
  end

  def peek
    @array.first
  end
end
