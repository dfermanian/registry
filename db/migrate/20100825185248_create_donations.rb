class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :gift_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expiration
      t.float :amount
      t.string :express_token
      t.string :express_payer_id
      t.boolean :paypal_donation
      t.timestamps
    end
  end
  
  def self.down
    drop_table :donations
  end
end
