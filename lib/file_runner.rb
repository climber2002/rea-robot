require_relative 'robot'
require_relative 'command_parser'

# a FileRunner is to run commands read from a file. In the file each
# line is a command, if a line starts with '#' it's deemed as a comment
# and will be ignored, and also empty lines will be ignored
class FileRunner

  attr_accessor :filepath, :robot, :command_parser

  def initialize(filepath)
    self.filepath = filepath
    self.robot = Robot.new
    self.command_parser = CommandParser.new
  end

  def run
    File.readlines(filepath).each do |line|
      if should_parse?(line) 
        command = command_parser.parse(line)
        command.execute(robot)
      end
    end
  end

  private

    # Returns true if the line is a command.
    # Empty lines or lines start with '#' will return false
    def should_parse?(line)
      stripped = line.strip
      (!stripped.empty?) && (!stripped.start_with?('#'))
    end
end