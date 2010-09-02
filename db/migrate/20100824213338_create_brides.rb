class CreateBrides < ActiveRecord::Migration
  def self.up
    create_table :brides do |t|
      t.string :name
      t.date :wedding_day
      t.timestamps
    end
  end
  
  def self.down
    drop_table :brides
  end
end
