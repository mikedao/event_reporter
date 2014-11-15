require_relative 'testhelper'
require 'sanitizer'
require 'csvhandler'
class SanitizerTest < Minitest::Test

  def test_format_zipcode
    assert_equal "12345",Sanitizer.format_zipcode("12345")
    assert_equal "07305",Sanitizer.format_zipcode("7305")
    assert_equal "00000",Sanitizer.format_zipcode("")
  end

  def test_zip_code_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.zip_code_sanitizer(csvfile.data)
    assert_equal "20010", sanitized_data[0][8]
    assert_equal "02703", sanitized_data[10][8]

  end


end
