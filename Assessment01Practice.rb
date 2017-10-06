#10:05

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil,&prc)
    if accumulator == nil
      accum = self[0]
      self.each_with_index do |el,idx|
        next if idx == 0
        accum = prc.call(accum,el)
      end
    else
      accum = accumulator
      self.each_with_index do |el,idx|

        accum = prc.call(accum,el)
      end

    end

    accum
  end
end


# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each do |n|
    return false if num % n == 0
  end
  return true
end

def primes(num)
  i = 2
  primes = []
  while primes.length < num
    primes << i if is_prime?(i)
    i+=1
  end
  primes
end


# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.
def factorial(num)
  return 1 if num == 0
  num * factorial(num-1)
end

def factorials_rec(num)
  #[1,1,2,6]
  factorial_list = []
  num.times do |i|
    factorial_list << factorial(i)
  end
  factorial_list
end


def factorials_rec(num)
  return [1] if num == 0
  factorial = 1
  (1..num).each do |n|
    factorial*=n
  end
  factorials_rec(num-1) + [factorial]

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new([])
    self.each_with_index do |num,idx|
      hash[num] += [idx]
    end
    hash.select {|k,v| v.length > 1}
  end
end


class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def is_palindrome?
    self.reverse == self
  end

  def symmetric_substrings
    list = []
    self.each_char.with_index do |char1,idx1|
      (idx1+1...self.length).each do |idx2|
        substring = self[idx1..idx2]
        if substring.is_palindrome?
          list << substring
        end
      end

    end
    list
  end
end


class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    if prc.nil?
      return self if self.length == 1
      mid_idx = self.length/2
      left = self[0...mid_idx]
      right = self[mid_idx..-1]
      Array.merge(left.merge_sort,right.merge_sort)
    end


  end

  private
  def self.merge(left, right, &prc)
    merged = []
    return left if right.empty?
    return right if left.empty?

    merged << (left[0] > right[0] ? right.shift : left.shift)
    merged + merge(left,right)

  end
end
