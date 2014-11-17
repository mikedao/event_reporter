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

  def test_format_city 
    assert_equal "university of richmond", Sanitizer.format_city("University of Richmond")
    assert_equal "syracuse", Sanitizer.format_city("Syracuse")
    assert_equal "no city provided", Sanitizer.format_city("")
    assert_equal "no city provided", Sanitizer.format_city(nil)
  end

  def test_city_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")  
    sanitized_data = Sanitizer.city_sanitizer(csvfile.data)
    assert_equal "washington", sanitized_data[0][6]
    assert_equal "monument beach", sanitized_data[21][6]
    assert_equal "yes", sanitized_data[34][6]
    assert_equal "university of richmond",sanitized_data[1469][6]
    assert_equal "johannesburg, south africa", sanitized_data[1765][6]
    assert_equal "sgsg", sanitized_data[1772][6]
    assert_equal "clinton", sanitized_data[1864][6]
    assert_equal "x", sanitized_data[1871][6]
    assert_equal "10 macvittie cirlcle", sanitized_data[4444][6]
    assert_equal "no city provided", sanitized_data[1121][6]
  end

  def test_format_state
    assert_equal "IN", Sanitizer.format_state("IN")
    assert_equal "NJ", Sanitizer.format_state("NJ")
    assert_equal "XX", Sanitizer.format_state("")
    assert_equal "XX", Sanitizer.format_state(nil)
  end

  def test_state_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.state_sanitizer(csvfile.data)
    assert_equal "DC", sanitized_data[0][7]
    assert_equal "MA", sanitized_data[21][7]
    assert_equal "SD", sanitized_data[34][7]
    assert_equal "XX", sanitized_data[465][7]
  end

  def test_date_sanitizer
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    sanitized_data = Sanitizer.regdate_sanitizer(csvfile.data)
    assert_equal "11/12/08", sanitized_data[0][0]
  end

  def test_format_date
    assert_equal "11/12/08", Sanitizer.format_regdate("11/12/08")
    assert_equal ""
  end
end
