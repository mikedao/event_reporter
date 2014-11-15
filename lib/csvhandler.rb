require 'csv'

class CSVHandler
  attr_accessor   :data

  def initialize
    @data = []
  end

  def load_file(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      data << [
        row[:regdate],row[:first_name],row[:last_name],row[:email_address],row[:homephone],
      row[:street],row[:city],row[:state],row[:zipcode]
      ]
    end
  end
end

csvfile = CSVHandler.new
csvfile.load_file("event_attendees.csv")
puts csvfile.data
