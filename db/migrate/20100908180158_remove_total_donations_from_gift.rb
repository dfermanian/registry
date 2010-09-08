class RemoveTotalDonationsFromGift < ActiveRecord::Migration
  def self.up
    remove_column :gifts, :total_donations
  end

  def self.down
    add_column :gifts, :total_donations, :float
  end
end
