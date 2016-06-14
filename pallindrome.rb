#solves pallindrome challenge, considering only alpha characters

def pallindrome?(str)
  stripped = str.gsub(/\W+/, '') 
  stripped.reverse == stripped
end

puts pallindrome?("race car")