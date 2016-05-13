def collatz_sequence(n)
  sequence = [n] 

  while n != 1
    n % 2 == 0 ? n /= 2 : (n = n * 3 + 1)
    sequence << n
  end
  sequence
end

max = 1
(1..1000000).each do |num| 
  max = num if collatz_sequence(num).length > collatz_sequence(max).length
end

max # returns 837799 
