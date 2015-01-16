class PurchaseItem < ActiveRecord::Base
  attr_accessible :price, :item_id, :purchase_id, :quantity, :options

  belongs_to :item
  belongs_to :purchase

  serialize :options

  # def color_name
  #   Color.find(self.options[:color_id]).name
  # end

  # def size_name
  #   ProductSize.find(self.options[:size_id]).size.name
  # end

  def total
    self.price.to_f * self.quantity.to_f
  end

  def present_name
    name = item.name

    # name += " - #{color_name}" unless self.options[:color_id].blank?
    # name += " - #{size_name}"  unless self.options[:size_id].blank?

    name
  end

  def get_sku
    "#{self.item_id}"
  end
end
