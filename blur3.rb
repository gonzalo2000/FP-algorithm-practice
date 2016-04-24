a = [[0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,0,0,1,0,0,0],
     [0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0]]

cloned = a.map(&:clone)

n = 3

a.each.with_index do |whole_row, row|
  whole_row.each.with_index do |cell, column|
    if cell == 1
      
      #central column & right side
      row_path = row - n
      column_path = column
      repetition = 2 * n + 1
      counter = 0
      (n+1).times do 
        (repetition).times do
          unless cloned[row_path][column_path].nil?
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
          unless cloned[row_path][column_path].nil?
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

cloned.each do |x| 
  print x
  puts
end