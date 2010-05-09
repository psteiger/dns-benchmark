#!/usr/bin/ruby

require 'entry'
require 'test/unit'

class TestEntry < Test::Unit::TestCase
  
  def setup
    @e = Entry.new('200.176.2.10', 'Terra')
  end

  def test_simple
    assert_equal('200.176.2.10', @e.ip)
    assert_equal('Terra', @e.name)
    assert_equal(4, @e.latencies.length, @e.latencies)
  end

end
