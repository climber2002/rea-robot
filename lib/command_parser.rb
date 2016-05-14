require_relative 'command'

class CommandParser

  # This map constant contains the mapping of all command names and their corresponding
  # command class. We find the command class through the command name. If in Rails we
  # can use ActiveSupport::Inflector to constantize the class and don't need this map.
  # However it's sufficient for this small project
  ALL_COMMANDS = { 'PLACE' => Command::Place, 'MOVE' => Command::Move, 'LEFT' => Command::Left, 
                   'RIGHT' => Command::Right, 'REPORT' => Command::Report }

  # Parse the line to a corresponding command instance.
  def parse(line)
    command, args = line.strip.split(' ')

    command_class = ALL_COMMANDS.fetch(command.to_s.upcase) do |command|
      raise ArgumentError, "Not recognized command: #{command}"
    end

    # If args are not supplied, we instantiate the command instance directly,
    # otherwise split the args by ',' and supply them as the initialization parameters
    if args.nil?
      command_class.new
    else
      command_class.new *args.split(',')
    end
  end
end