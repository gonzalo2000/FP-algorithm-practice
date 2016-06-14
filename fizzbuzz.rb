#Solution to the FizzBuzz challenge

(1..100).each do |x|
  puts "FizzBuzzz" if x % 3 == 0 && x % 5 == 0 
  puts "Fizz" if x % 3 == 0
  puts x % 5 == 0 ?  "Buzz" :  x
end