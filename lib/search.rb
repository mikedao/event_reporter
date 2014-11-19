class Search

  def search(data, attribute, criteria)


    attribute = attribute.to_sym
    data.select { |data| data.send(attribute) == criteria }

  end

end
