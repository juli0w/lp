class AddProductOptionsTable < ActiveRecord::Migration
  def up
    create_table(:products_sizes)  {|t| t.references :product, :size }
    create_table(:colors_products) {|t| t.references :product, :color }
  end

  def down
    drop_table :products_sizes
    drop_table :products_colors
  end
end
