class CartItem
  attr_accessor :product_id, :quantity, :price

  def initialize product_id, quantity=1, price=nil
    self.product_id = product_id
    self.quantity   = quantity
    self.price      = price || self.product.price
  end

  def update quantity
    self.quantity = quantity
  end

  def total
    self.price.to_f * self.quantity.to_f
  end

  def product
    Product.find(self.product_id)
  end
end