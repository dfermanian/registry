class Gift < ActiveRecord::Base
#  attr_accessible :name, :price, :total_donations
  belongs_to :bride
  has_many :donations
end
