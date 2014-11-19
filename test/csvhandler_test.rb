require_relative 'testhelper'
require 'csvhandler'


class CSVHandlerTest < Minitest::Test

  def test_opens_file
    csvtest = CSVHandler.new
    csvtest.load_file("event_attendees.csv")
    refute csvtest.data.nil?
  end

  def test_data_in_file?
    csvtest = CSVHandler.new
    csvtest.load_file("event_attendees.csv")
    refute csvtest.data[0].nil?
  end

  def test_saves
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    csvfile.save_file("test.csv", csvfile.data)
    assert File.exist?("test.csv")
  end
end
