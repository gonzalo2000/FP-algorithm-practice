#alternative version

class Image
  attr_accessor :arr
  
  def initialize(arr)
    @arr = arr
  end
  
  def output_image
    @arr.each do |item|
      puts item.join
    end
  end
  
  def transform_once
    result = Image.transform(@arr)
    Image.new(result)
  end
  
  def self.transform(ary)
    cloned = ary.map(&:clone)

    #scan original array for 1; map crosses into clone if found
    ary.each.with_index do |row, row_index|
      row.each.with_index do |cell, col|
        if cell == 1
          cloned[row_index][col+1] = 1 unless col+1 >= row.length #copy right
          cloned[row_index+1][col] = 1 unless row_index+1 >= cloned.length # copy down
          cloned[row_index][col-1] = 1 unless col.zero? # copy left
          cloned[row_index-1][col] = 1 unless row_index.zero? #copy up
        end
      end
    end
    cloned
  end

  def blur(n)
    blurred = @arr
    n.times { blurred = Image.transform(blurred) }
    Image.new(blurred)
  end
    
end

image = Image.new([[0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,1,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [1,0,0,0,0,0,0,0,0]])

y = image.blur(4)

y.arr.each {|row| p row}

#image.transform_once