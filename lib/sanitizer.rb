module Sanitizer

  def self.zip_code_sanitizer(data)
    data.each do |data|
      data[8] = format_zipcode(data[8])
    end
  end

  def self.format_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end
end
