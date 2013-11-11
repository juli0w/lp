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

  def update_quantity sku, quantity=1
    if quantity.to_i == 0
      remove sku
    else
      update(sku, quantity)
    end
  end

  def remove sku
    self.items.delete_if do |item|
      item.sku == sku
    end
  end

  def update sku, quantity
    self.items.each do |item|
      if (item.sku == sku)
        item.update(quantity)
      end
    end
  end

  def add_item item_id, color_id='', size_id=''
    quantity ||= 1

    item = self.items.select do |item|
      item.sku == CartItem.get_sku(item_id,
                                   color_id: color_id,
                                   size_id: size_id)
    end.first

    if item.blank?
      self.items << CartItem.new(item_id, quantity, nil,
                                 color_id: color_id, size_id: size_id)
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