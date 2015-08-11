class CreateSetups < ActiveRecord::Migration
  def change
    create_table :setups do |t|
      t.string :emails

      t.timestamps
    end
    
    Setup.create(emails: 'lojadopintor.jlle@hotmail.com')
  end
end
