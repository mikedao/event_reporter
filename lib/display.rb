module Display

  def self.intro
    "Welcome to Event Reporter EXTREME"
  end

  def self.command_request
    "> "
  end

  def self.help_only
    "Command\tArgument
load \t<filename.csv>
queue\tcount\n\tclear\n\tprint\n\tprint by <attribute>\n\tsave to <filename.csv>
find\t<attribute> <criteria>
    "
  end


end
