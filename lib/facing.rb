require 'singleton'

# The Facing module contains Facing classes that represent the facing direction
# of the robot. We have 4 Facing classes: North, West, Souch and East. Each class
# needs to implement 3 instance methods in addition to the to_s method:
#
# - rotate_left: Returns the new Facing when the robot rotates left
# - rotate_right: Returns the new Facing when the robot rotates right
# - next_move_position: Given a current Position(x, y), returns the next position if the robot makes a move, 
# this method doesn't consider if the position will fall off the table or not.
#
# As the Facing classes don't maintain their own state, for each Facing class we only need one instance,
# so all Facing classes are implemented as Singleton to save memory
module Facing

  # Parse the facing from a string
  def self.parse_facing(str)
    case str.to_s.downcase.to_sym
    when :north then North.instance
    when :west  then West.instance
    when :south then South.instance
    when :east  then East.instance
    else 
      raise ArgumentError, "Invalid facing: #{str}"
    end
  end

  class North

    include Singleton

    def rotate_left
      West.instance
    end

    def rotate_right
      East.instance
    end

    def next_move_position(x, y)
      [x, y + 1]
    end

    def to_s
      "NORTH"
    end

  end

  class West

    include Singleton

    def rotate_left
      South.instance
    end

    def rotate_right
      North.instance
    end

    def next_move_position(x, y)
      [x - 1, y]
    end

    def to_s
      "WEST"
    end
  end

  class South

    include Singleton

    def rotate_left
      East.instance
    end

    def rotate_right
      West.instance
    end

    def next_move_position(x, y)
      [x, y - 1]
    end

    def to_s
      "SOUTH"
    end
  end

  class East

    include Singleton

    def rotate_left
      North.instance
    end

    def rotate_right
      South.instance
    end

    def next_move_position(x, y)
      [x + 1, y]
    end

    def to_s
      "EAST"
    end
  end

end