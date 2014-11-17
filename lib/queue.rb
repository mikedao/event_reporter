class Queue #where search is saved
  attr_reader   :data

  def initialize
    @data = []
  end

  def store(the_find)
    @data = the_find

  end

  def clear
    @data = []
  end

end
