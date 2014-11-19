require_relative 'testhelper'
require 'csvhandler'
require 'queue'


class QueueTest < Minitest::Test

  def test_initializes_without_data
    queue = Queue.new
    assert queue.data.empty?
  end

  def test_store_works
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    queue = Queue.new
    queue.store(csvfile.data)
    refute queue.data.nil?
  end

  def test_clear_works
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    queue = Queue.new
    queue.store(csvfile.data)
    queue.clear
    assert_equal [], queue.data
  end

  def test_sort_works
    csvfile = CSVHandler.new
    csvfile.load_file("event_attendees.csv")
    queue = Queue.new
    queue.store(csvfile.data)
    queue.print_by($stdin, $stdout, "first_name")
    assert_equal "5175",queue.data[0].first_name
  end


end
