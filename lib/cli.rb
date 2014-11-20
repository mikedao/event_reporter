require 'display'
require 'command_processor'
require 'colorize'

class CLI
  attr_reader   :command,
                :instream,
                :outstream,
                :commandprocessor

  def initialize(instream, outstream)
    @command            = ""
    @instream           = instream
    @outstream          = outstream
    @commandprocessor   = CommandProcessor.new(instream,outstream)
  end

  def call
    outstream.puts Display.intro.red
    outstream.puts Display.options_of_what_to_do

    until finished?
      outstream.print Display.command_request
      @command = instream.gets.strip.downcase
      commandprocessor.process_command(command)
    end
  end

  def finished?
    command == "q" || command == "quit"
  end


end
