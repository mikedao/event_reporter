require 'display'
require 'help'
require 'csvhandler'
require 'queue'
require 'search'

class CommandProcessor
  attr_reader   :command,
                :instream,
                :outstream,
                :csvfile,
                :queue,
                :search

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
    @csvfile    = CSVHandler.new
    @queue      = Queue.new
    @search     = Search.new
  end

  def process_command(entered_command)
    @command = entered_command
    case
    when command == ""
        outstream.puts Display.invalid_command
    when command == "q" || "quit"
        outstream.puts Display.quit_message
    when command[0..3] == "help"
      Help.show_help(instream,outstream,command)
    when command[0..3] == "load"
      load_file(command)
    when command[0..4] == "queue"
      queue_commands(command)
    when command[0..3] == "find"
      find_things(command)
    else
      outstream.puts Display.invalid_command
    end
  end

  def queue_commands(entered_command)
    case
    when entered_command == "queue count"
      outstream.puts "Number of items: #{queue.data.count}"
    when entered_command == "queue clear"
      queue.clear
      outstream.puts Display.queue_clear
    when entered_command == "queue print"
      queue.print(instream,outstream)
    end
    parsed_command = entered_command.split
    queue.print_by(instream, outstream, parsed_command[3]) if parsed_command[2] == "by"
    csvfile.save_file(parsed_command[3],queue.data) if parsed_command[2] == "to"
  end


  def find_things(entered_command)
    attribute = entered_command.split[1]
    search_criteria = determine_criteria(entered_command)
    queue.store(search.search(csvfile.data, attribute, search_criteria))
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
      outstream.puts Display.loading_file
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
