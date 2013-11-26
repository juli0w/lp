class AddOptionsToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :options, :string
  end
end
