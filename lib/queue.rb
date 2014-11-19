require 'outputter'

class Queue
  attr_reader   :data

  def initialize
    @data = []
  end

  def store(search_results)
    @data = search_results
  end

  def clear
    @data = []
  end

  def print(instream, outstream)
    Outputter.output(instream, outstream, data)
  end

  def print_by(instream, outstream, attribute)
    @data = @data.sort_by { |datum| datum.send(attribute) }
    print(instream,outstream)
  end


end
