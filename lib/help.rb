require 'help_messages'
module Help

  def self.show_help(instream, outstream, command)

    case
    when command == "help"
      outstream.puts HelpMessages.help_only
    when command == "help queue count"
      outstream.puts HelpMessages.help_queue_count
    when command == "help queue clear"
      outstream.puts HelpMessages.help_queue_clear
    when command == "help queue print"
      outstream.puts HelpMessages.help_queue_print
    when command == "help queue print by"
      outstream.puts HelpMessages.help_queue_print_by
    when command == "help queue save to"
      outstream.puts HelpMessages.help_queue_save_to
    when command == "help load"
      outstream.puts HelpMessages.help_load
    when command == "help find"
      outstream.puts HelpMessages.help_find
    else
      outstream.puts HelpMessages.not_valid_command
    end

  end



end
