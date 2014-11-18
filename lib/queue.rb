
require_relative 'outputter'
require_relative 'csvhandler'
require_relative 'search'
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
    Outputter.output(instream,outstream,sorted_data)
  end

end
