#['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
def sluggish_octopus(a)

  a.each_with_index do |fish,idx|
    max = true
    a.each_with_index do |fish2,idx2|
      next if idx == idx2
      max = false if fish2.length > fish.length
    end
    return fish if max == true
  end
end

def merge_sort(a,&prc)
  prc ||= Proc.new { |x, y| x <=> y }
  return a if a.length == 1
  mid = a.length/2
  left = a[0..mid]
  right = a[mid..-1]
  merge(merge_sort(left,&prc),merge_sort(right,&prc),&prc)

end

def merge(left,right,&prc)
  merged = []
  until left.empty? || right.empty?
    if prc.call(left[0],right[0])==1
      merged << right.shift
    else
      merged << left.shift
    end

  end
  merged.concat(left)
  merged.concat(right)

end

def dominant(fishes)
  prc = Proc.new{|x,y| y.length <=> x.length}
  merge_sort(fishes,&prc)[0]

end

def clever(fishes)
  longest_fish = fishes[0]
  longest_length = longest_fish.length
  fishes.each do |fish|
    if fish.length > longest_length
      longest_fish = fish
      longest_length = fish.length
    end
  end
  longest_fish

end

def slow_dance(direction,tiles_array)
  tiles_array.each_with_index do |tile,idx|
    return idx if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
