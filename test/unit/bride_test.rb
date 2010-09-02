require 'test_helper'

class BrideTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bride.new.valid?
  end
end
