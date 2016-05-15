require_relative 'command'

# The main job of CommandParser is to parse a command line to a Command instance
class CommandParser

  # This map constant contains the mapping of all command names to their corresponding
  # command class. We search for the command class through the command name. If in Rails we
  # can use ActiveSupport::Inflector to constantize the class from command name directly and 
  # don't need this map. However it's sufficient for this small project.
  ALL_COMMANDS = { 'PLACE' => Command::Place, 'MOVE' => Command::Move, 'LEFT' => Command::Left, 
                   'RIGHT' => Command::Right, 'REPORT' => Command::Report }

  # Parse a line to the corresponding command instance. A command may or may not have arguments.
  # The arguments are separated by ',' if there is any. It will raise ArgumentError if the command
  # is not parsable. Currently only PLACE command takes arguments.
  #
  # Comamnd example:
  #         PLACE 1,2,NORTH
  #         MOVE
  def parse(line)
    command, args = line.to_s.strip.split(' ')

    command_class = ALL_COMMANDS.fetch(command.to_s.upcase) do |command|
      raise ArgumentError, "Not recognizable command: #{command}"
    end

    # If args are not supplied, we instantiate the command instance directly,
    # otherwise split the args by ',' and supply them as the arguments when creating
    # the command instance
    if args.nil?
      command_class.new
    else
      command_class.new *args.split(',')
    end
  end
end