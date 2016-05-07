class Image
  attr_accessor :array
  
  def initialize(array)
    self.array = array
  end
  
  def output_image
    self.array.each do |item|
      puts item.join
    end
  end

  def transform 
    cloned = self.array.map(&:clone)

    #scan original array for 1; map crosses into clone if found
    self.array.each.with_index do |row, row_index|
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

  def blur(n) #not working at present
    blurred = Image.new(self)
    n.times do
      blurred = blurred.transform
    end
    blurred
  end
    
end

image = Image.new([[0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,1,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0]])

y = image.transform
