require_relative 'display'
require_relative 'help'
require_relative 'csvhandler'

class CommandProcessor
  attr_reader   :command,
                :instream,
                :outstream

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
  end

  def process_command(entered_command)
    @command = entered_command
    case
    when command == ""
        outstream.puts Display.invalid_command
    when command[0..3] == "help"
      Help.show_help(instream,outstream,command)
    when command[0..3] == "load"
      puts "call load method"
    when command[0..4] == "queue"
      puts "call queue method"
    when command[0..3] == "find"
      puts "call find method"
    else
      outstream.puts Display.invalid_command
    end
  end

  def finished?(entered_command)
    entered_command = "quit" || entered_command = "q"
  end


end
