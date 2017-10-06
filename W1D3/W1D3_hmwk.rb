def sum_to(num)
  return 0 if num == 0
  num + sum_to(num-1)
end

def add_numbers(arr)
  return 0 if arr.length == 0
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return 1 if n == 1
  return nil if n < 1
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  #flavors is array
  return false if flavors.length == 0
  return true if flavors[-1] == favorite
  ice_cream_shop(flavors.take(flavors.length-1),favorite)
end

def reverse(str)
  return "" if str.length == 0
  str[-1] + reverse(str[0...str.length-1])
end
