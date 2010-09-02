class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.float :total_donations
      t.integer :bride_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :gifts
  end
end
