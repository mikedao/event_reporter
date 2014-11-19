require_relative 'testhelper'
require 'csvhandler'
require 'queue'
require 'search'
require 'command_processor'

class CommandProcessorTest < Minitest::Test

  def test_find_things
    cp = CommandProcessor.new($stdin,$stdout)
    cp.find_things("find first_name allison")
    refute cp.queue.nil?
  end

  def test_determine_criteria
    cp = CommandProcessor.new($stdin, $stdout)
    criteria = cp.determine_criteria("find first_name allison")
    assert_equal "allison", criteria
  end

  def test_entered_filename
    cp = CommandProcessor.new($stdin, $stdout)
    filename = cp.entered_filename("load filename.csv")
    assert_equal "filename.csv", filename
  end

  def test_finished
    cp = CommandProcessor.new($stdin, $stdout)
    assert cp.finished?("q")
    assert cp.finished?("quit")
  end

end
