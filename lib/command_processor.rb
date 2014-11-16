require_relative 'display'

class CommandProcessor
  attr_reader   :command,
                :instream,
                :outstream

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
  end

  def process_command(command)
    @command = command
    case
    when help_only?
      outstream.puts Display.help_only
    when help_queue_only?
      outstream.puts Display.help_queue_only
    end


  end

  def help_only?
    command[0] == "help" && command[1].nil?
  end

  def not_help_only?
    command[0] == "help" && !command[1].nil?
  end

  def finished?(input)
    input == ["q"] || input == ["quit"]
  end

  def help_queue_only?
    command[0] == "help" && command[1] && command[2].nil?
  end


end
