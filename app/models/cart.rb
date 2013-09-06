class Cart
  attr_accessor :items

  def initialize
    self.items = []
  end

  def add_item item_id, quantity=1
    item = self.items.select {|item| item.product_id == item_id }.first

    if item.blank?
      self.items << CartItem.new(item_id, quantity)
    else
      item.quantity += quantity
    end
  end

  def subtotal
    self.items.sum(&:total)
  end

  def total
    subtotal
  end

  def empty?
    self.items.empty?
  end
end