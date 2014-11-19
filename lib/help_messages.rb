module HelpMessages

  def self.help_only
  "Command\t\tArgument\nload \t\t<filename.csv>\nqueue\t\tcount, clear, print, print by <attribute>\nsave to \t<filename.csv>\nfind\t\t<attribute> <criteria>"
  end

  def self.not_valid_command
    "I can't find a command that matches what you entered."
  end

  def self.help_queue_count
    "Output how many records are in the current queue"
  end

  def self.help_queue_clear
    "Empty the queue."
  end

  def self.help_queue_print
    "Print out a tab delimited table with a header row."
  end

  def self.help_queue_print_by
    "queue print by <attribute>\n Print the data table sorted by the specified attribute, such as zipcode."
  end

  def self.help_queue_save_to
    "queue save to <filename.csv> Export the current queue to the specified filename as a CSV."
  end

  def self.help_load
    "load <filename>\n Erase any loaded data and parse the specified file. If no filename is given, default to event_attendees.csv"
  end

  def self.help_find
    "find <attribute> <criteria>\n Load the queue with all records matching the criteria for the given attribute."
  end
end
