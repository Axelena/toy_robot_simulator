require_relative 'table'

class Robot

  attr_reader :x_position, :y_position, :vector

  def initialize(table)
    @table = table
  end

  def place(position_x, position_y, vector) 	
    if @table.valid_vector?(vector) && @table.inside_table?(position_x.to_i, position_y.to_i)
      @x_position = position_x
      @y_position = position_y
      @vector = vector
    else
      print "Wrong coordinates or vector"
    end
  end

  def move
    if placed?
      case @vector
        when "NORTH" 
          if @table.inside_table?((@y_position+1), @x_position)
            @y_position += 1 
          end
        when "EAST" 
          if @table.inside_table?(@y_position, @x_position+1) 
            @x_position += 1
          end
        when "SOUTH" 
          if @table.inside_table?(@y_position-1, @x_position) 
            @y_position -= 1
          end
        when "WEST" 
          if @table.inside_table?(@y_position, @x_position-1)  
            @x_position -= 1
          end
      end

      move_to(@x_position,@y_position)
      
    else
      puts "The robot hasn't been placed yet"
    end

  end

  def left
    new_vector = @vector == vectors.first ? vectors.last : vectors[vector_index - 1]
    change_vector(new_vector)    
  end

  def right
    new_vector = @vector == vectors.last ? vectors.first : vectors[vector_index + 1]
    change_vector(new_vector) 
  end

  def location 
    "#{@x_position},#{@y_position},#{@vector}" if placed?
  end

  def placed?
    !(@vector.nil?)
  end


  private

  def move_to(position_x, position_y) 
    unless @table.inside_table?(position_x, position_y)
      puts "Can't be moved there"
    end
  end

  def change_vector(vector) 
    @vector = vector
    puts "The robot has been rotated to #{vector}"
  end

  def vectors
    Table::VALID_VECTORS
  end

  def vector_index
    vectors.index(@vector)
  end
end
