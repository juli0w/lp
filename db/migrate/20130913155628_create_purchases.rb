class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :phone
      t.string :cellphone
      t.string :complement
      t.string :cep
      t.string :address
      t.string :district
      t.string :number
      t.string :city
      t.string :uf
      t.integer :user_id

      t.timestamps
    end
  end
end
