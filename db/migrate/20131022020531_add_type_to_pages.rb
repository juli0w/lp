class AddTypeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_type, :integer, default: 0
  end
end
