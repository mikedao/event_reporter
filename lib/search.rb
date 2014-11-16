class Search

  def lookup_by_reg_date(data, search_criteria)
    @queue = data.select do |r_date|
      r_date[0] == search_criteria
    end
  end

  def lookup_by_first_name(data, search_criteria)
    @queue = data.select do |f_name|
      f_name[1] == search_criteria
    end
  end

  def lookup_by_last_name(data, search_criteria)
    @queue = data.select do |l_name|
      l_name[2] == search_criteria
    end
  end

  def lookup_by_email(data, search_criteria)
    @queue = data.select do |e_mail|
      e_mail[3] == search_criteria
    end
  end

  def lookup_by_phone(data, search_criteria)
    @queue = data.select do |h_phone|
      h_phone[4] == search_criteria
    end
  end

  def lookup_by_street(data, search_criteria)
    @queue = data.select do |street|
      street[5] == search_criteria
    end
  end

  def lookup_by_street(data, search_criteria)
    @queue = data.select do |city|
      city[6] == search_criteria
    end
  end

  def lookup_by_street(data, search_criteria)
    @queue = data.select do |state|
      state[7] == search_criteria
    end
  end

  def lookup_by_street(data, search_criteria)
    @queue = data.select do |zip|
      zip[8] == search_criteria
    end
  end
  
end
