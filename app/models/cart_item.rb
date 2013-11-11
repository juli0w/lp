class CartItem
  attr_accessor :sku, :product_id, :quantity, :price, :opts

  def initialize product_id, quantity=1, price=nil, opts={}
    self.product_id = product_id
    self.quantity   = quantity
    self.opts       = opts
    self.price      = price || self.product.price
    self.sku        = CartItem.get_sku(product_id, opts)
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

  def color_name
    Color.find(opts[:color_id]).name
  end

  def size_name
    Size.find(opts[:size_id]).name
  end

  def self.get_sku product_id, opts={}
    "#{product_id}-#{opts.inspect}"
  end
end