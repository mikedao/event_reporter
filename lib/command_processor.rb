class CommandProcessor

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
  end

  def process_command(command)
  end

  def finished?(input)
    input == ["q"] || input == ["quit"]
  end
end
