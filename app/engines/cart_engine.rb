module CartEngine
  def self.included(base)
    base.helper_method :current_cart
  end
  
  def current_cart
    session[:cart] ||= Cart.new
  end
end