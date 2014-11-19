require 'csv'
require 'entry'


class CSVHandler
  attr_accessor   :data

  def initialize()
    @data = []
  end

  def load_file(filename)
    self.data = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      self.data << Entry.new(row)
    end
  end

  def save_file(filename, data)
    File.open(filename, "w") do |file|
      file.puts csv_header
    end

    File.open(filename, 'a') do |file|
      data.map do |data|
        file.puts data_to_save(data)
      end
    end
  end

  def data_to_save(data)
    "#{data.send("regdate")},#{data.send("first_name")},#{data.send("last_name")},#{data.send("email_address")},#{data.send("homephone")},#{data.send("street")},#{data.send("city")},#{data.send("state")},#{data.send("zipcode")}"
  end

  def csv_header
    "RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode"
  end

end
