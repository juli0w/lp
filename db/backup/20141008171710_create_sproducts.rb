class CreateSproducts < ActiveRecord::Migration
  def change
    create_table :sproducts do |t|
      t.string :name
      t.string :description
      t.integer :external_id
      t.string :um
      t.decimal :price, precision: 10, scale: 2
      t.boolean :active
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
