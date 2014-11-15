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

  def test_format_phone_number
    assert_equal "1112223333", Sanitizer.format_phone_number("(111) 222-3333")
    assert_equal "9820000000", Sanitizer.format_phone_number("9.82E+00")
    assert_equal "0000000000", Sanitizer.format_phone_number("")
    assert_equal "0000000000", Sanitizer.format_phone_number(nil)

  end

  def test_phone_number_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.phone_number_sanitizer(csvfile.data)
    assert_equal "6154385000", sanitized_data[0][4]
    assert_equal "4018685000", sanitized_data[10][4]
    assert_equal "3810700000", sanitized_data[122][4]
    assert_equal "9820000000", sanitized_data[14][4]
    assert_equal "4042185000", sanitized_data[1766][4]

  end



end
