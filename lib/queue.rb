require 'outputter'

class Queue
  attr_reader   :data

  def initialize
    @data = []
  end

  def store(the_find)
    @data = the_find
  end

  def clear
    @data = []
  end

  def print(instream, outstream)
    Outputter.output(instream, outstream, data)
  end

  def load_data(data)
    @data = data
  end

  def print_by(instream, outstream, attribute)
    sorted_data = @data.sort_by { |datum| datum.send(attribute) }
    Outputter.output(instream,outstream,sorted_data)
  end

end
