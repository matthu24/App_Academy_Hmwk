class Stack
    #Last in first out
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack << el
      el

    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack.dup
    end
  end

class Queue
  #first in first out
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
      key_exists = false
      @map.each_with_index do |pair,idx|
        if pair[0] == key
          pair[1] = value
          key_exists = true
        end
      end
      @map << [key,value] if key_exists == false
  end

  #return the value of the key
  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def remove(key)
    @map = @map.reject{|pair| pair[0] == key}
  end

  def show(key)
    deep_dup(@map)
  end

  def deep_dup(arr)
    duped = []
    arr.each do |el|
      if el.is_a?(Array)
        duped << deep_dup(el)
      else
        duped << el
      end
    end
    duped
  end

end
