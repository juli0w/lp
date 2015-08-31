class Cart
  attr_accessor :items, :coupon

  def initialize
    self.items = []
  end
  
  def load_coupon coupon
    if !Coupon.active? coupon
      return false
    end
    
    self.coupon = coupon
    true
  end
  
  def get_coupon
    Coupon.where(name: self.coupon).first
  end

  def to_purchase user_id
    purchase = Purchase.create(user_id: user_id)
    purchase.update_attributes(coupon_id: get_coupon.id) unless self.coupon.nil?

    self.items.each do |i|
      purchase.purchase_items.create({
           item_id: i.item_id,
          quantity: i.quantity,
             price: i.price,
           options: i.opts })
    end
    
    OrderMailer.order_message(purchase.id).deliver

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
      self.items << CartItem.new(item_id, quantity.to_i)
    else
      item.quantity = item.quantity.to_i + quantity.to_i
    end
  end

  def subtotal
    self.items.sum(&:total)
  end

  def total
    self.subtotal - self.discount
  end
  
  def discount
    return 0 if self.coupon.nil?
    
    d = self.get_coupon.value

    if self.get_coupon.discount_type = 0
      return self.subtotal * (d/100)
    else
      return d
    end
  end

  def empty?
    self.items.empty?
  end
end