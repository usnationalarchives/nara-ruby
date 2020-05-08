# frozen_string_literal: true

require 'minitest/autorun'
require 'nara'
require 'mocha/minitest'

class TestFaraday < Minitest::Test
  def setup
    @nara = Nara::Records.new
  end

  def test_headers
    faraday_version = Faraday::VERSION
    header = { 'User-Agent' => "nara-ruby (Faraday v#{faraday_version})",
    'Accept' => 'application/json' }
    assert_equal header, @nara.send(:faraday).headers
  end

  def test_adapter
    assert_includes @nara.send(:faraday).adapter(Faraday.default_adapter),
                    Faraday::Adapter::NetHttp
  end
end
