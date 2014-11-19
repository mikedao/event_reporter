require 'sanitizer'

class Entry
  attr_reader   :regdate,
                :first_name,
                :last_name,
                :email_address,
                :homephone,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(data)
    @regdate          = data[:regdate]
    @first_name       = Sanitizer.downcaser(data[:first_name])
    @last_name        = Sanitizer.downcaser(data[:last_name])
    @email_address    = Sanitizer.downcaser(data[:email_address])
    @homephone        = Sanitizer.format_phone_number(data[:homephone])
    @street           = Sanitizer.downcaser(data[:street])
    @city             = Sanitizer.format_city(data[:city])
    @state            = Sanitizer.format_state(data[:state])
    @zipcode          = Sanitizer.format_zipcode(data[:zipcode])
  end

end
