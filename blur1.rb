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
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

