require_relative 'tabletop'

# A Robot is associated with a Tabletop and it maintains its current position and facing.
class Robot

  attr_accessor :tabletop
  attr_accessor :x, :y, :facing

  def initialize
    self.tabletop = Tabletop.new(5, 5)
  end

  # Returns true if the robot is already placed on the table, returns false othersise. By default
  # the Robot is NOT on the table and it is placed on the table when receving a valid PLACE command. 
  # When not on the table it will ignore other commands such as MOVE, LEFT, RIGHT, REPORT. A robot is only on 
  # table when the x, y and facing has value
  def on_the_table?
    !!(x && y && facing)
  end

  # Place the robot at Position(x, y) and set the corresponding facing, 
  # Returns true if it's placed successfully, otherwise returns false
  def place(x, y, facing)
    return false if falls_off?(x, y)
    self.x = x
    self.y = y
    self.facing = facing
    true
  end

  # Rotate the robot to the left, returns true if the robot rotates successfully,
  # otherwise returns false
  def rotate_left
    return false unless on_the_table?
    self.facing = facing.rotate_left
    true
  end

  # Rotate the robot to the right, returns true if the robot rotates successfully,
  # otherwise returns false
  def rotate_right
    return false unless on_the_table?
    self.facing = facing.rotate_right
    true
  end

  # Make one unit move forward the facing, the move is ignored if the robot is not on the 
  # table, or it will fall off the table after the move. Returns true if the move is made 
  # successfully, returns false otherwise
  def move
    return false unless on_the_table?

    next_x, next_y = facing.next_move_position(x, y)
    unless falls_off?(next_x, next_y)
      self.x = next_x
      self.y = next_y
      true
    else
      false
    end
  end

  def to_s
    on_the_table? ? "#{x},#{y},#{facing}" : "Not on the table"
  end

  private

    # Returns true if the Position(x, y) falls off the table, return false otherwise
    def falls_off?(x, y)
      tabletop.falls_off?(x, y)
    end
end