#Luhn Algorithm

def card_is_valid?(number)
  split_number = number.to_s.chars.map(&:to_i)
  
  #double every other digit from the right; subtract 9 if doubling added digits
  doubled = split_number
  counter = -2
  while doubled[counter] do 
    doubled[counter] = doubled[counter] * 2
    doubled[counter] -= 9 if doubled[counter] > 9
    counter -= 2
  end
  
  #confirm validity by checking whether sum is divisible by 10
  doubled.inject(0, :+) % 10 == 0
end

card_is_valid?(4194560385008504)

# returns true for 4194560385008504
# returns false for 4194560385008505