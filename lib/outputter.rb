require_relative 'csvhandler'
require_relative 'sanitizer'
# to output the queue (Search results)

module Outputter

  def self.header
    "#{"LAST NAME".ljust(15)}#{"FIRST NAME".ljust(15)}#{"EMAIL".ljust(45)}#{"ZIP CODE".ljust(10)}#{"CITY ".ljust(20)}#{"STATE".ljust(10)}#{"ADDRESS".ljust(45)}#{"PHONE".ljust(20)}"
  end

  def self.output(instream, outstream, data)
    outstream.puts header
    data.each do |data|
      outstream.puts data_display(data)
    end
  end

  def self.data_display(data)
    "#{data[2].ljust(15)}#{data[1].ljust(15)}#{data[3].ljust(45)}#{data[8].ljust(10)}#{data[6].ljust(20)}#{data[7].ljust(10)}#{data[5].ljust(45)}#{data[4].ljust(20)}"
  end

end
