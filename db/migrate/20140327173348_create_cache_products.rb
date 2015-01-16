class CreateCacheProducts < ActiveRecord::Migration
  def change
    create_table :cache_products do |t|
      t.integer :cache_type
      t.integer :item_id

      t.timestamps
    end
  end
end
