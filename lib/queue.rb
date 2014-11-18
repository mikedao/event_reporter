require_relative 'outputter'
require_relative 'csvhandler'
require_relative 'search'
class Queue
  attr_reader   :data

  def initialize
    @data = []
  end

  def clear
    @data = []
  end

  def print
    Outputter.output(data)
  end

  def load_data(data)
    @data = data
  end

  def print_by(attribute)
    print_by_map = Hash.new
    print_by_map =
    {
      :reg_date       => 0,
      :first_name     => 1,
      :last_name      => 2,
      :email_address  => 3,
      :home_phone     => 4,
      :street         => 5,
      :city           => 6,
      :state          => 7,
      :zip_code       => 8
    }

    attribute = attribute.to_sym

    sorted_data = @data.sort_by { |datum| datum[print_by_map[attribute]] }
    Outputter.output(sorted_data)
  end

end

queue = Queue.new
csvfile = CSVHandler.new
csvfile.load_file("event_attendees.csv")
searcher = Search.new
queue.load_data(searcher.search(csvfile.data, "first_name", "allison"))
queue.print_by("last_name")
