require_relative 'robot'
require_relative 'table'

class CommandProcessor

  VALID_COMMANDS = ["MOVE", "LEFT", "RIGHT", "REPORT"]  

  def initialize(robot, table, io = STDOUT)
    @table = table
    @robot = robot
    @io = io
  end

  def process(command)
    command = create(command)
  end

  def command_proceed(command)
    if command == 'REPORT'
      robot_location = @robot.location
      puts robot_location unless robot_location.nil?
    elsif command == 'MOVE'
      @robot.move
    elsif command == 'LEFT'
      @robot.left
    elsif command == 'RIGHT'
      @robot.right  
    end 

  end

  # PLACE command will process with coordinates + vector	
  def place_command_proceed
    @robot.place(@x_position.to_i, @y_position.to_i, @vector.to_s.strip)
    puts "The robot has been placed"
  end

  def create(command)
    # remember the command
    #initial_command = command.dup 

    if is_place_command?(command) && !@robot.placed?
      place_command_proceed
    elsif valid_command?(command)
      command_proceed(command)
    else	
      puts "Wrong command. Try again"
    end
  end
  

  private
  
  def valid_command?(com)
    VALID_COMMANDS.include?(com)
  end  

  def is_place_command?(com)
      com.slice!('PLACE ')
      @x_position, @y_position, @vector =  com.split(",")
      #check if coordinates and vector are OK
      @table.inside_table?(@x_position.to_i, @y_position.to_i) && @table.valid_vector?(@vector.to_s)
  end
end
