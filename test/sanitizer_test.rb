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

  def test_name_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.name_sanitizer(csvfile.data)
    assert_equal "allison", sanitized_data[0][1]
    assert_equal "colin", sanitized_data[10][1]
    assert_equal "claire", sanitized_data[122][1]
    assert_equal "paul", sanitized_data[14][1]
    assert_equal "joe", sanitized_data[1766][1]
    assert_equal "x", sanitized_data[186][1]
    assert_equal "9", sanitized_data[430][1]
    assert_equal "nguyen", sanitized_data[0][2]
    assert_equal "harmston", sanitized_data[10][2]
    assert_equal "voigt", sanitized_data[122][2]
    assert_equal "fulghum", sanitized_data[14][2]
    assert_equal "waterman", sanitized_data[1766][2]
    assert_equal "norris", sanitized_data[186][2]
    assert_equal "gayle", sanitized_data[430][2]
  end

  def test_first_name_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.first_name_sanitizer(csvfile.data)
    assert_equal "allison", sanitized_data[0][1]
    assert_equal "colin", sanitized_data[10][1]
    assert_equal "claire", sanitized_data[122][1]
    assert_equal "paul", sanitized_data[14][1]
    assert_equal "joe", sanitized_data[1766][1]
    assert_equal "x", sanitized_data[186][1]
    assert_equal "9", sanitized_data[430][1]
  end

  def test_last_name_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.last_name_sanitizer(csvfile.data)
    assert_equal "nguyen", sanitized_data[0][2]
    assert_equal "harmston", sanitized_data[10][2]
    assert_equal "voigt", sanitized_data[122][2]
    assert_equal "fulghum", sanitized_data[14][2]
    assert_equal "waterman", sanitized_data[1766][2]
    assert_equal "norris", sanitized_data[186][2]
    assert_equal "gayle", sanitized_data[430][2]
    assert_equal "siegrest-jones", sanitized_data[542][2]
  end

  def test_city_sanitizer
    skip
    csvfile = CSVHandler.new
    csvfile.loadfile("event_attendees.csv")
  end

  def test_format_city
    assert_equal "yes", Sanitizer.format_city("yes")
  end

end
