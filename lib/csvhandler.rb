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

  def txt_header
    "RegDate\tfirst_Name\tlast_Name\tEmail_Address\tHomePhone\tStreet\tCity\tState\tZipcode"
  end

  def txt_save_to(data)
    "#{data.send("regdate")}\t#{data.send("first_name")}\t#{data.send("last_name")}\t#{data.send("email_address")}\t#{data.send("homephone")}\t#{data.send("street")}\t#{data.send("city")}\t#{data.send("state")}\t#{data.send("zipcode")}"
  end


  def save_json(filename, data)
    File.open(filename, "w") do |file|
      file.puts "["
    end

    File.open(filename, 'a') do |file|

      data.map do |data|

        file.puts json_data(data)
      end
      file.puts "]"
    end
  end

  def json_data(data)
    "{
    \"RegDate\":\"#{data.send(regdate)}\",
    \"first_Name\":\"#{data.send(first_name)}\",
    \"last_Name\":\"#{data.send(last_name)}\",
    \"Email_Address\":\"#{data.send(email_address)}\",
    \"HomePhone\":\"#{data.send(homephone)}\",
    \"Street\":\"#{data.send(street)}\",
    \"City\":\"#{data.send(city)}\",
    \"State\":\"#{data.send(state)}\",
    \"Zipcode\":#{data.send(zipcode)},
    "
  end

end
