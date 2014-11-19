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
  
end
