class Table

  VALID_VECTORS = ["NORTH", "EAST", "SOUTH", "WEST"] 

  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def inside_table?(x_position, y_position)
    within_width?(x_position) && within_height?(y_position)
  end

  def valid_vector?(v)
    VALID_VECTORS.include?(v.strip.to_s)
  end  
   

  private

  def within_width?(x)
    0 <= x && x <= @width-1
  end

  def within_height?(y)
    0 <= y && y <= @height-1
  end     
end
