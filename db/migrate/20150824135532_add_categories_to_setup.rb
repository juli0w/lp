class AddCategoriesToSetup < ActiveRecord::Migration
  def change
    add_column :setups, :categories, :text
  end
end
