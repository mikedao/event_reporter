class Search

  def search(data, attribute, criteria)
    data.select { |data| data.send(attribute) == criteria }
  end

end
