#Solves factorial challenge

def factorial(number)
  count = number
  solution = 1
  while count > 0
    solution *= count
    count -= 1
  end
  solution
end

puts factorial(5)