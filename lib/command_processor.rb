require_relative 'display'
require_relative 'help'
require_relative 'csvhandler'
require_relative 'queue'

class CommandProcessor
  attr_reader   :command,
                :instream,
                :outstream,
                :csvfile,
                :queue

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
    @csvfile    = CSVHandler.new
    @queue      = Queue.new
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
      find_things(command)
    else
      outstream.puts Display.invalid_command
    end
  end


  def find_things(entered_command)
    attribute = entered_command.split[1]
    search_criteria = determine_criteria(entered_command)
    outstream.puts "Search Criteria :#{search_criteria}"
    outstream.puts "Attribute :#{attribute}"
  end

  def determine_criteria(entered_command)
    criteria = entered_command.split
    criteria[2..-1].join(' ')
  end

  def load_file(entered_command)
    if entered_filename(entered_command) == nil
      filename = "event_attendees.csv"
    else
      filename = entered_filename(entered_command)
    end
    if File.exist?(filename)
      csvfile.load_file(filename)
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
