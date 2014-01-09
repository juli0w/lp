class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :content
      t.integer :state
      t.integer :user_id

      t.timestamps
    end
  end
end
