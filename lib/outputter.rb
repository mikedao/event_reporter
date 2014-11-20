module Outputter

  def self.header
    "#{"LAST NAME".ljust(15)}#{"FIRST NAME".ljust(15)}#{"EMAIL".ljust(45)}#{"ZIP CODE".ljust(10)}#{"CITY ".ljust(20)}#{"STATE".ljust(10)}#{"ADDRESS".ljust(45)}#{"PHONE".ljust(20)}".blue
  end

  def self.output(instream, outstream, data)
    clear_screen(instream,outstream)
    outstream.puts header
    data.each do |data|
      outstream.puts data_display(data)
    end
  end

  def self.data_display(data)
    "#{data.send("last_name").ljust(15)}#{data.send("first_name").ljust(15)}#{data.send("email_address").ljust(45)}#{data.send("zipcode").ljust(10)}#{data.send("city").ljust(20)}#{data.send("state").ljust(10)}#{data.send("street").ljust(45)}#{data.send("homephone").ljust(20)}"
  end


  def self.clear_screen(instream,outstream)
    outstream.print "\e[2J\e[f"
  end

end
