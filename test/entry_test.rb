require 'simplecov'
SimpleCov.start
require_relative 'testhelper'
require 'sanitizer'
require 'csvhandler'


class EntryTest < Minitest::Test

  def test_it_takes_data
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data.nil?
  end

  def test_it_has_a_regdate
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].regdate.nil?
    refute csvfile.data[12].regdate.nil?
  end

  def test_it_has_a_first_name
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].first_name.nil?
    refute csvfile.data[12].first_name.nil?
  end

  def test_it_has_a_last_name
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].last_name.nil?
    refute csvfile.data[12].last_name.nil?
  end

  def test_it_has_a_email_address
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].email_address.nil?
    refute csvfile.data[12].email_address.nil?
  end

  def test_it_has_a_homephone
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].homephone.nil?
    refute csvfile.data[12].homephone.nil?
  end

  def test_it_has_a_street
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].street.nil?
    refute csvfile.data[12].street.nil?
  end

  def test_it_has_a_city
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].city.nil?
    refute csvfile.data[12].city.nil?
  end

  def test_it_has_a_state
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].state.nil?
    refute csvfile.data[12].state.nil?
  end

  def test_it_has_a_zipcode
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    refute csvfile.data[0].zipcode.nil?
    refute csvfile.data[12].zipcode.nil?
  end
end
