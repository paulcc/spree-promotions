class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.integer :product_id
      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
