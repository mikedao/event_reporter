module Sanitizer


  def self.sanitize_data(data)
    zip_code_sanitizer(data)
    phone_number_sanitizer(data)
    name_sanitizer(data)
    city_sanitizer(data)
    state_sanitizer(data)
  end

  def self.zip_code_sanitizer(data)
    data.each do |data|
      data[8] = format_zipcode(data[8])
    end
  end

  def self.format_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.phone_number_sanitizer(data)
    data.each do |data|
      data[4] = format_phone_number(data[4])
    end
  end

  def self.format_phone_number(phone_number)
    phone_number.to_s.gsub(/[^0-9]/, "").ljust(10,"0")[-10..-1]
  end

  def self.name_sanitizer(data)
    first_name_sanitizer(data)
    last_name_sanitizer(data)
  end

  def self.first_name_sanitizer(data)
    data.each { |data| data[1].downcase! }
  end

  def self.last_name_sanitizer(data)
    data.each { |data| data[2].downcase! }
  end

  def self.city_sanitizer(data)
    data.each do |data|
      data[6] = format_city(data[6])
    end
  end

  def self.format_city(city)
    if city.nil? || city == ""
      city = "no city provided"
    else
      city.downcase
    end

  end

  def self.state_sanitizer(data)
    data.each do |data|
      data[7] = format_state(data[7])
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
