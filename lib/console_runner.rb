require_relative 'robot'
require_relative 'command_parser'

class ConsoleRunner

  attr_accessor :robot, :command_parser

  def initialize
    self.robot = Robot.new
    self.command_parser = CommandParser.new
  end

  def run
    puts "Type a command to run it, type QUIT to exit."
    while (line = $stdin.readline.chomp) && !quit_command?(line)
      begin 
        command_parser.parse(line).execute(robot)
      rescue ArgumentError
        puts "Invalid command, please try again. Command: #{line}"
      end
    end
  end

  private

    def quit_command?(line)
      line.upcase == 'QUIT'
    end
end