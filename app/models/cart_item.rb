class CartItem
  attr_accessor :product_id, :quantity, :price

  def initialize product_id, quantity=1, price=nil
    self.product_id = product_id
    self.quantity   = quantity
    self.price      = price || self.product.price
  end

  def total
    self.price * self.quantity
  end

  def product
    Product.find(self.product_id)
  end
end