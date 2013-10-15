class AddStateToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :state, :integer, default: 0
  end
end
