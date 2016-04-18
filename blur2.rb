a = [[0,0,0,0],
     [1,0,0,0],
     [0,0,0,0],
     [0,0,0,1]]

new = a.map(&:clone)

#scan original array for 1; map crosses into new array if found
a.each_with_index do |m, n| # n == index of main array
    m.each_with_index do |x, y| # y == index of subarray
      if x == 1 
            new[n][y] = 1
            new[n][y+1] = 1 unless (a[n][y+1]).nil? #right
            new[n][y-1] = 1 unless (a[n][y-1]).nil? || y == 0 #left
            new[n-1][y] = 1 unless (a[n-1][y]).nil? || n == 0 #top
            unless n == (a.length - 1)
              new[n+1][y] = 1 unless (a[n+1][y]).nil? || n == (a.size - 1)#bottom
            end
        end
    end
end
