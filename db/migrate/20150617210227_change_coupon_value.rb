class ChangeCouponValue < ActiveRecord::Migration
  def change
    change_column :coupons, :value, :decimal, :precision => 8, :scale => 2
  end
end
