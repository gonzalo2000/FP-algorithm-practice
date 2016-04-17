#This currently works for inner items and/or last elements

#Throws error when there is a 1 on the last row

#Bug for the first element of the row (turns the last element of 
#the row into a 1 as well)

a = [[0,0,0,0],
     [0,0,1,0],
     [0,0,0,0],
     [0,0,0,0]
    ]

#create a placeholder copy of the array; all elements == nil
new = Array.new(a.length).map! {|element| element = Array.new(a[0].length)}

#scan original array for 1; map crosses into new array if found
a.each_with_index do |m, n| # n == index of main array
    m.each_with_index do |x, y| # y == index of subarray
        if x == 1
            new[n][y] = 1
            new[n][y+1] = 1 unless (a[n][y+1]).nil? #right
            new[n][y-1] = 1 unless (a[n][y-1]).nil? #left
            new[n-1][y] = 1 unless (a[n-1][y]).nil? #top
            new[n+1][y] = 1 unless (a[n+1][y]).nil? #bottom
        end
    end
end

#changes nils into 0s and returns new array
new.each do |element|
  element.map! {|x| x == nil ? x = 0 : x = 1 }
end