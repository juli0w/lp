class AddCategoryIdToColors < ActiveRecord::Migration
  def change
    add_column :colors, :category_id, :integer

    Color.update_all(category_id: 1)
  end
end
