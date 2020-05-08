# frozen_string_literal: true

require 'minitest/autorun'
require 'nara'
require 'mocha/minitest'

class TestSearchRecords < Minitest::Test
  def setup
    @nara = Nara::Records.new
  end

  def test_search_by_keyword_using_pagination
    @nara.expects(:search).with({ q: 'Nixon', rows: 1, offset: 20 })
         .returns([{ 'key' => 'value' }])
    assert_equal [{ 'key' => 'value' }],
                 @nara.search({ q: 'Nixon', rows: 1, offset: 20 })
  end

  def test_search_by_keyword_using_naids
    @nara.expects(:search).with({ naIds: 574_067 })
         .returns([{ 'key' => 'value' }])
    assert_equal [{ 'key' => 'value' }], @nara.search({ naIds: 574_067 })
  end
end
