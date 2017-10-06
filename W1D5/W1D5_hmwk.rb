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



#enqueue(el), dequeue, and show

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





#assign(key, value), lookup(key), remove(key), show

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    if !@map.flatten.include?(key)
      @map.each_with_index do |pair,idx|
        if pair[0] == key
          pair[1] = value
        end
      end
    else
      @map << [key,value]
    end
  end

  #return the value of the key
  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key 
    end
  end

  def remove(key)

  end

  def show(key)

  end


end
