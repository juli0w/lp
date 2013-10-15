class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :phone     , :string
    add_column :profiles, :cellphone , :string
    add_column :profiles, :district  , :string
    add_column :profiles, :complement, :string
  end
end
