class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :cep
      t.string :address
      t.string :number
      t.string :city
      t.string :uf
      t.integer :user_id

      t.timestamps
    end
  end
end
