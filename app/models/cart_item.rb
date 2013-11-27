class CartItem
  attr_accessor :sku, :product_id, :quantity, :price, :opts

  def initialize product_id, quantity=1, opts={}
    self.product_id = product_id
    self.quantity   = quantity
    self.opts       = opts
    self.sku        = CartItem.get_sku(product_id, opts)
    
    calculate_price!
  end

  def calculate_price!
    self.price = calculate_price
  end

  def calculate_price
    size_id = self.opts[:size_id]

    if size_id.blank?
      return self.product.price
    else
      ProductSize.find(size_id).price
    end
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
    ProductSize.find(opts[:size_id]).size.name
  end

  def self.get_sku product_id, opts={}
    "#{product_id}-#{opts[:color_id]}-#{opts[:size_id]}"
  end
end