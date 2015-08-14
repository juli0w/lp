class CreateFailures < ActiveRecord::Migration
  def change
    create_table :failures do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
