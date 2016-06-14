#Reverse a string without calling the ruby .reverse method

def rev(string)
  ary = string.chars
  reversed = []
  count = -1
  while ary[count]
    reversed << ary[count]
    count -= 1
  end
  reversed.join
end

puts rev("gonzalo")