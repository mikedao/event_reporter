require_relative 'csvhandler'
require_relative 'sanitizer'

class Search

  def search(data, attribute, criteria)
    search_map = Hash.new
    search_map =
    {
      :reg_date       => 0,
      :first_name     => 1,
      :last_name      => 2,
      :email_address  => 3,
      :home_phone     => 4,
      :street         => 5,
      :city           => 6,
      :state          => 7,
      :zip_code       => 8
    }

    attribute = attribute.to_sym
    data.select { |data| data[search_map[attribute]].downcase == criteria }

  end

end
