class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :message
      t.string :subject
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
