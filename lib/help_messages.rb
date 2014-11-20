module HelpMessages
  require 'terminal-table/import'


  def  initialize
    @user_table = user_table
  end

  def self.help_only
    puts
    user_table = table do |v|
    v.style.width = 100
    v.headings = 'HELP MENU', 'User Commands *type this*','What the Command Will Do'
    v << [ " ", "load" , "load the stored records"]
    v << [ " ", "find <attribute> <criteria>", "find the records you want"]
    v << [ " ", "queue count", "show how many records are in the current queue"]
    v << [ " ", "queue clear", "empty the queue"]
    v << [ " ", "queue print", "output a table with a header row of attributes"]
    v << [ " ", "queue print by <attribute>", "output sorted by attribute"]
    v << [ " ", "queue save to <filename.csv> ","export to a csv file"]
  end
  puts user_table
  puts "Attribute options: last_name, first_name, email, zipcode, city, state, street and homephone"
  puts "Criteria examples: 'New York', '20011', 'John', 'Chicago'"

  # "Command\t\tArgument\nload \t\t<filename.csv>\nqueue\t\tcount, clear, print, print by <attribute>\nsave to \t<filename.csv>\nfind\t\t<attribute> <criteria>"
  end

  def self.not_valid_command
    "I can't find a command that matches what you entered."
  end

  def self.help_queue_count
    "Outputs how many records are in the current queue."
  end

  def self.help_queue_clear
    "Queue clear empties the queue."
  end

  def self.help_queue_print
    "prints out a tab delimited table with a header row."
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
