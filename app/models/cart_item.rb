class CartItem
  attr_accessor :sku, :item_id, :quantity, :price, :opts

  def initialize item_id, quantity=1, opts={}
    self.item_id = item_id
    self.quantity   = quantity
    self.opts       = opts
    self.sku        = CartItem.get_sku(item_id, opts)
    
    calculate_price!
  end

  def calculate_price!
    self.price = calculate_price
  end

  def calculate_price
    return self.item.price
  end

  def update quantity
    self.quantity = quantity
  end

  def total
    self.price.to_f * self.quantity.to_f
  end

  def item
    Item.find(self.item_id)
  end

  # def color_name
  #   Color.find(opts[:color_id]).name
  # end

  # def size_name
  #   ProductSize.find(opts[:size_id]).size.name
  # end

  def self.get_sku item_id, opts={}
    "#{item_id}"
  end
end