class Gift < ActiveRecord::Base
  attr_accessible :name, :price#, :total_donations
  belongs_to :bride
  has_many :donations

  def total_donations
    total=0
    for donation in donations
      if donation.transactions[0]
      {
          total = total + donation.amount
      }
    end
    total
  end
  
end
