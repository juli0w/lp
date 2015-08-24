class AddCategoriesToSetup < ActiveRecord::Migration
  def change
    add_column :setups, :categories, :string
  end
end
