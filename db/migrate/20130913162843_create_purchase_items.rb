class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.integer :purchase_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
