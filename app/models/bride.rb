class Bride < ActiveRecord::Base
#  attr_accessible :name, :wedding_day
  has_many :gifts, :dependent => :destroy

  accepts_nested_attributes_for :gifts, :reject_if => lambda{ |a| a[:name].blank? }, :allow_destroy => true
end
