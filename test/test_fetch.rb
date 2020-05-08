# frozen_string_literal: true

require 'minitest/autorun'
require 'nara'
require 'mocha/minitest'

class TestFetch < Minitest::Test
  def setup
    @nara = Nara::Records.new
  end

  def test_fetch
    @nara.expects(:fetch).with('v1', { naId: 574_067 })
         .returns([{ 'key' => 'value' }])
    assert_equal [{ 'key' => 'value' }], @nara.send(:fetch, 'v1', { naId: 574_067 })
  end

  def test_raise_not_found
    assert_raises(Nara::NotFound) do
      @nara.send(:fetch, 'nonexistent', naId: 574_067)
    end
  end

  def test_raise_api_error
    assert_raises(Nara::ApiError) do
      @nara.send(:fetch, 'v1', { 'api' => 'error' })
    end
  end
end
