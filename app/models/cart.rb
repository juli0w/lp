class Cart
  attr_accessor :items

  def initialize
    self.items = []
  end

  def to_purchase user_id
    purchase = Purchase.create(user_id: user_id)

    self.items.each do |item|
      purchase.purchase_items.create({
        product_id: item.product_id,
          quantity: item.quantity,
             price: item.price })
    end

    purchase
  end

  def update_quantity item_id, quantity=1
    if quantity.to_i == 0
      remove item_id
    else
      update(item_id, quantity)
    end
  end

  def remove item_id
    self.items.delete_if do |item|
      item.product_id == item_id
    end
  end

  def update item_id, quantity
    self.items.each do |item|
      item.update(quantity) if (item.product_id.to_i == item_id.to_i)
    end
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