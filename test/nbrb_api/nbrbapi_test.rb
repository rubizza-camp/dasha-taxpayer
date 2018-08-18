require 'test_helper' # из корня rails 'bin/rails test test/nbrbapi/nbrbapi.rb'
# require_relative '../test_helper' # из корня rails 'ruby test/nbrbapi/nbrbapi.rb' и первый вариант

class TestClass1 < Minitest::Test
  def test_exists
    assert NbrbApi::Curencies
  end
end

class TestClass2 < Minitest::Test
  def test_test_request_rate_nbrb_api_currency
    VCR.use_cassette('nbrb') do
      request_rate = NbrbApi::Curencies.currency_official_rate('USD', '2018-8-18')
      assert_equal Float, Float
    end
  end
end