require_relative 'testhelper'
require 'cli'


class CLITest < Minitest::Test

  def test_quit
      cli= CLI.new($stdin,$stdout)
      cli.stub :command, 'q' do
        assert cli.finished?
      end

      cli.stub :command, 'quit' do
        assert cli.finished?
      end
    end
end
