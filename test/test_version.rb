# frozen_string_literal: true

require 'minitest/autorun'
require 'nara'
require 'mocha/minitest'

class TestVersion < Minitest::Test
  def setup
    @nara = Nara::Records.new
  end

  def test_version
    assert_equal 'v1', @nara.send(:version)
  end
end
