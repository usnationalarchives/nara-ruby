# frozen_string_literal: true

require 'minitest/autorun'
require 'nara'
require 'mocha/minitest'

class TestBaseUrl < Minitest::Test
  def setup
    @nara = Nara::Records.new
  end

  def test_base_url
    assert_equal 'https://catalog.archives.gov/api', @nara.send(:base_url)
  end
end
