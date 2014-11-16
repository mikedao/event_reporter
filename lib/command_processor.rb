require_relative 'display'
require_relative 'help'
require_relative 'csvhandler'

class CommandProcessor
  attr_reader   :command,
                :instream,
                :outstream,
                :csvfile

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
    @csvfile    = CSVHandler.new
  end

  def process_command(entered_command)
    @command = entered_command
    case
    when command == ""
        outstream.puts Display.invalid_command
    when command == "q"
        outstream.puts Display.quit_message
    when command[0..3] == "help"
      Help.show_help(instream,outstream,command)
    when command[0..3] == "load"
      load_file(command)
    when command[0..4] == "queue"
      puts "call queue method"
    when command[0..3] == "find"
      puts "call find method"
    else
      outstream.puts Display.invalid_command
    end
  end

  def load_file(entered_command)
    if entered_command.split[1] == nil
      filename = "event_attendees.csv"
    else
      filename = entered_command.split[1]
    end
    csvfile.load_file(filename)
    outstream.puts csvfile.data[0]
  end




  def finished?(entered_command)
    entered_command = "quit" || entered_command = "q"
  end


end
