class ChangePriceOnPurchaseItem < ActiveRecord::Migration
  def change
    remove_column :purchase_items, :price
    add_column    :purchase_items, :price, :decimal, precision: 10, scale: 2
  end
end
