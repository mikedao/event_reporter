module Display

  def self.intro
    "Welcome to Event Reporter EXTREME"
  end

  def self.command_request
    "> "
  end

  def self.invalid_command
    "That was an invalid command, please try again."
  end

  def self.quit_message
    "Quitting Event Reporter."
  end
  
  #
  #
  # def self.help(item)
  #   case
  #   when item == "load"
  #     help_load
  #   when item == "queue"
  #     help_queue_only
  #   when item == "find"
  #     help_find
  #   end
  # end
  #
  # def self.help_queue(item)
  #   case
  #   when item == "count"
  #     "Output how many records are in the current queue"
  #   when item == "clear"
  #     "Empty the queue"
  #   when item == "print"
  #     "Print out a tab-delimited data table with a header row."
  #   end
  # end
  #
  #
  # def self.help_load
  #   "load <filename.csv> where filename.csv is the file you wish to load."
  # end
  #
  # def self.help_queue_only
  #   "Possible queue commands:\n\tcount\n\tclear\n\tprint\n\tprint by\n\tsave to"
  # end
  #
  # def self.help_find
  #   "find <attribute> <criteria> - Loads the queue with all items that have <criteria> in <attribute>"
  # end

end
