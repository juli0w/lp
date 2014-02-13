class CreateTicketRepplies < ActiveRecord::Migration
  def change
    create_table :ticket_repplies do |t|
      t.integer :ticket_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
