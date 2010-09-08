class AddPaypalEmailToBride < ActiveRecord::Migration
  def self.up
    add_column :brides, :paypal_email, :string
  end

  def self.down
    remove_column :brides, :paypal_email
  end
end
