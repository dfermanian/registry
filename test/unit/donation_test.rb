require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Donation.new.valid?
  end
end
