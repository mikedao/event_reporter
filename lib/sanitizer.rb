module Sanitizer

  def self.zip_code_sanitizer(data)
    data.each do |data|
      data[8] = data[8].to_s.rjust(5,"0")[0..4]
    end
  end

end
