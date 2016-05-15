require_relative 'robot'
require_relative 'command_parser'

# ConsoleRunner reads commands from standard input, it will give error messages
# when an invalid command is entered. And to quit the runner, type 'QUIT'
class ConsoleRunner

  attr_accessor :robot, :command_parser

  def initialize
    self.robot = Robot.new
    self.command_parser = CommandParser.new
  end

  def run
    puts "Type a command to run it, or type QUIT to exit."

    while (line = $stdin.readline.chomp) && !quit_command?(line)
      run_command(line)
    end
  end

  private

    def quit_command?(line)
      line.upcase == 'QUIT'
    end

    def run_command(line)
      command_parser.parse(line.to_s).execute(robot)
    rescue ArgumentError
      puts "Invalid command, please try again. Command: #{line}"
    end
end