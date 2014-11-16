require_relative 'display'
require_relative 'command_processor'

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
    outstream.puts Display.intro

    until commandprocessor.finished?(command)
      outstream.print Display.command_request
      @command = instream.gets.strip.downcase.split(' ')
      commandprocessor.process_command(command)
    end
  end

end

cli = CLI.new($stdin, $stdout)
cli.call
