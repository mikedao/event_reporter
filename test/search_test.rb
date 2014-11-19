require_relative 'testhelper'
require 'csvhandler'
require 'search'

class SearchTest < Minitest::Test
  def test_to_search_by_reg_date
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "regdate", "11/12/08 10:47").count
    assert_equal 1 , results_count
  end

  def test_to_search_by_first_name
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "first_name", "allison").count
    assert_equal 16, results_count
  end

  def test_to_search_by_last_name
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "last_name", "smith").count
    assert_equal 35, results_count
  end

  def test_to_search_by_email
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "email_address", "ltb3@jumpstartlab.com").count
    assert_equal 1, results_count
  end

  def test_to_search_by_home_phone
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "homephone", "6033053000").count
    assert_equal 1, results_count
  end

  def test_to_search_by_street
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "street", "3515 school st").count
    assert_equal 1, results_count
  end

  def test_to_search_by_city
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "city", "austin").count
    assert_equal 22, results_count
  end

  def test_to_search_by_state
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "state", "tx").count
    assert_equal 64, results_count
  end

  def test_to_search_by_zipcode
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    find = Search.new
    results_count = find.search(csvfile.data, "zipcode", "20011").count
    assert_equal 4, results_count
  end

end
