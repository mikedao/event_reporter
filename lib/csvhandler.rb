require 'csv'

class CSVHandler
  attr_accessor   :data

  def initialize()
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
    "#{data[0]},#{data[1]},#{data[2]},#{data[3]},#{data[4]},#{data[5]},#{data[6]},#{data[7]},#{data[8]}"
  end

  def csv_header
    "RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode"
  end



end
