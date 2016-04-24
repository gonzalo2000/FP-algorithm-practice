class Image
  attr_accessor :array
  
  def initialize(array)
    self.array = array
  end
  
  # Blur 1 exercise
  def output_image
    self.array.each do |item|
      puts item.join
    end
  end

  # Blur 2 exercise
  def transform 
    new = self.array.map(&:clone)

    #scan original array for 1; map crosses into clone if found
    self.array.each_with_index do |m, n| # n == index of main array
        m.each_with_index do |x, y| # y == index of subarray
          if x == 1 
                new[n][y] = 1
                new[n][y+1] = 1 unless (new[n][y+1]).nil? #right
                new[n][y-1] = 1 unless (new[n][y-1]).nil? || y == 0 #left
                new[n-1][y] = 1 unless (new[n-1][y]).nil? || n == 0 #top
                unless n == (new.length - 1)
                  new[n+1][y] = 1 unless (new[n+1][y]).nil? || n == (new.size - 1) #bottom
                end
            end
        end
    end
    new
  end

  #Blur 3 exercise
  def blur(distance)
    cloned = self.array.map(&:clone) #changes will map into array clone
    
    n = distance # maximum vertical/horizontal distance

    self.array.each.with_index do |whole_row, row|
      whole_row.each.with_index do |cell, column|
        if cell == 1
          
          #central column & right side
          row_path = row - n
          column_path = column
          repetition = 2 * n + 1
          counter = 0
          (n+1).times do 
            (repetition).times do
              unless (row_path > cloned.length - 1 ) || cloned[row_path][column_path].nil? 
                cloned[row_path][column_path] = 1
              end
              row_path += 1
            end
            counter += 1
            repetition -= 2
            column_path += 1
            row_path = row - n + counter
          end

          #central column & left side
          row_path = row - n
          column_path = column
          repetition = 2 * n + 1
          counter = 0
          (n+1).times do 
            (repetition).times do
              unless (row_path > cloned.length - 1 ) || cloned[row_path][column_path].nil? 
                cloned[row_path][column_path] = 1
              end
              row_path += 1
            end
            counter -= 1
            repetition -= 2
            column_path -= 1
            row_path = row - n - counter
          end
        end
      end
    end
    cloned # return the array with all the mapped changes
  end
  
end

# image = Image.new([[0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,1,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [0,0,0,0,0,0,0,0,0],
#                    [1,0,0,0,0,0,0,0,1]])