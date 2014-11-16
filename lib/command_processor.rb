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
    if entered_filename(entered_command) == nil
      filename = "event_attendees.csv"
    else
      filename = entered_filename(entered_command)
    end
    if File.exist?(filename)
      csvfile.load_file(filename)
      puts csvfile.data[0]
    else
      outstream.puts Display.file_does_not_exist
    end
  end

  def entered_filename(entered_command)
    entered_command.split[1]
  end




  def finished?(entered_command)
    entered_command = "quit" || entered_command = "q"
  end


end
