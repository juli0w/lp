class Cart
  attr_accessor :items

  def initialize
    self.items = []
  end

  def to_purchase user_id
    purchase = Purchase.create(user_id: user_id)

    self.items.each do |i|
      purchase.purchase_items.create({
           item_id: i.item_id,
          quantity: i.quantity,
             price: i.price,
           options: i.opts })
    end

    purchase
  end

  def update_quantity sku, quantity=1
    if quantity.to_i == 0
      remove sku
    else
      update(sku, quantity)
    end
  end

  def remove sku
    self.items.delete_if do |i|
      i.sku == sku
    end
  end

  def update sku, quantity
    self.items.each do |i|
      if (i.sku == sku)
        i.update(quantity)
      end
    end
  end

  def add_item item_id, quantity
    quantity ||= 1

    item = self.items.select do |i|
      i.sku == CartItem.get_sku(item_id)
    end.first

    if item.blank?
      self.items << CartItem.new(item_id, quantity)
    else
      item.quantity += quantity.to_i
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