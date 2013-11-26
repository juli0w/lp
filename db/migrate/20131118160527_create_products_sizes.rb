class CreateProductsSizes < ActiveRecord::Migration
  def change
    create_table :products_sizes do |t|
      t.decimal :price
      t.integer :product_id
      t.integer :size_id
    end
  end
end
