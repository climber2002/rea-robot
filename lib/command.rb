require_relative 'facing'

# The Command module contains all command classes. Each command class should implement
# the execute method and robot is the only parameter of the method.
# Here we put all commands in one source file as it's a fairly small project. The command classes
# should be separated into its own file when the command classes become more complex
module Command

  # The Place command which places the robot at a certain position with facing direction
  class Place
    attr_accessor :x, :y, :facing

    def initialize(x, y, facing)
      self.x = Integer(x)
      self.y = Integer(y)
      self.facing = Facing.parse_facing(facing)
    end

    def execute(robot)
      robot.place(x, y, facing)
    end

  end

  # The Move command which moves the robot
  class Move

    def execute(robot)
      robot.move
    end

  end

  # The Left command which rotates the robot to the left
  class Left

    def execute(robot)
      robot.rotate_left
    end

  end

  # The Right command which rotates the robot to the right
  class Right

    def execute(robot)
      robot.rotate_right
    end

  end

  # The Report command which announces the X,Y and F of the robot,
  # by default it outputs to the standard output, but you can also supply another output.
  class Report

    attr_accessor :output

    def initialize(output = $stdout)
      self.output = output
    end

    def execute(robot)
      output.puts robot if robot.on_the_table?
    end

  end
end