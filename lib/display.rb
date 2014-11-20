module Display

  def self.intro
    "Welcome to Event Reporter EXTREME"
  end

  def self.options_of_what_to_do
    "\nType 'load,' to access the database, 'help' for a complete list of user commands, or 'quit' to exit the program.\n"
  end

  def self.command_request
    "> "
  end

  def self.invalid_command
    "That was an invalid command, please try again."
  end

  def self.quit_message
    "Quitting Event Reporter Extreme."
  end

  def self.file_does_not_exist
    "File does not exist."
  end

  def self.queue_clear
    "Queue cleared."
  end

  def self.loading_file
    "Loading file and sanitizing data, please wait.".red
  end

end
