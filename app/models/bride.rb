class Bride < ActiveRecord::Base
#  attr_accessible :name, :wedding_day
  has_many :gifts

  accepts_nested_attributes_for :gifts
end
