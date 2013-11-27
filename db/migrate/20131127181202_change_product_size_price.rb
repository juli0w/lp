class ChangeProductSizePrice < ActiveRecord::Migration
  def change
    remove_column :products_sizes, :price
    add_column :products_sizes, :price, :decimal, precision: 10, scale: 2
  end
end
