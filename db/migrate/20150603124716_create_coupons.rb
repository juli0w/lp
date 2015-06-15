class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name
      t.decimal :value
      t.integer :discount_type
      t.datetime :expire_at
      t.integer :owner_id
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
