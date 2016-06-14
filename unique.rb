#return array without repeated elements, without calling .uniq

def no_repeat(ary)
  new = []
  ary.each { |x| new << x unless new.include?(x) }
  new
end

print no_repeat(["dog", "cat", "chicken", "dog", "cat"])