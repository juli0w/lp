class PurchaseItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :purchase_id, :quantity, :options

  belongs_to :product
  belongs_to :purchase

  serialize :options

  def color_name
    Color.find(self.options[:color_id]).name
  end

  def size_name
    Size.find(self.options[:size_id]).name
  end

  def total
    self.price.to_f * self.quantity.to_f
  end
end
