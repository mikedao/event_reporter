require_relative 'testhelper'
require 'sanitizer'
require 'csvhandler'
class SanitizerTest < Minitest::Test

  def test_format_zipcode
    assert_equal "12345",Sanitizer.format_zipcode("12345")
    assert_equal "07305",Sanitizer.format_zipcode("7305")
    assert_equal "00000",Sanitizer.format_zipcode("")
    assert_equal "00000",Sanitizer.format_zipcode(nil)
  end


  def test_format_phone_number
    assert_equal "1112223333", Sanitizer.format_phone_number("(111) 222-3333")
    assert_equal "9820000000", Sanitizer.format_phone_number("9.82E+00")
    assert_equal "0000000000", Sanitizer.format_phone_number("")
    assert_equal "0000000000", Sanitizer.format_phone_number(nil)
  end

  def test_downcaser
    assert_equal "apple", Sanitizer.downcaser("Apple")
    assert_equal "none", Sanitizer.downcaser(nil)
    assert_equal "none", Sanitizer.downcaser("")
  end

  def test_format_state
    assert_equal "nj", Sanitizer.format_state("NJ")
    assert_equal "nj", Sanitizer.format_state("nj")
    assert_equal "xx", Sanitizer.format_state("")
    assert_equal "xx", Sanitizer.format_state(nil)
  end

end
