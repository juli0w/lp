class AddFieldsToFailures < ActiveRecord::Migration
  def change
    add_column :failures, :state, :boolean, default: false
    add_column :failures, :backtrace, :text
    add_column :failures, :details, :text
    add_column :failures, :request, :text
  end
end
