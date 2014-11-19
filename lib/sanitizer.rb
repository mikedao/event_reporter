module Sanitizer

  def self.format_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.format_phone_number(phone_number)
    phone_number.to_s.gsub(/[^0-9]/, "").ljust(10,"0")[-10..-1]
  end

  def self.downcaser(data)
    if data.nil? || data == ""
      data = "none"
    else
      data.downcase
    end
  end

  def self.format_city(city)
    if city.nil? || city == ""
      city = "no city provided"
    else
      city.downcase
    end
  end

  def self.format_state(state)
    if state == "" || state.nil?
      state = "xx"
    else
      state = state[0..1].downcase
    end
  end
end
