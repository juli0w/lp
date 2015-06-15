class Purchase < ActiveRecord::Base
  attr_accessible :name, :address, :cellphone, :cep, :city, :complement,
                  :number, :phone, :uf, :user_id, :district, :coupon_id

  belongs_to :user
  belongs_to :coupon
  has_many :purchase_items

  STATES = {
    0 => "Aguardando pagamento",
    1 => "Pagamento confirmado",
    2 => "Produtos enviados",
    3 => "Cancelado"
  }

  RECEIVER = "juli0w@hotmail.com"
  TOKEN    = "B3F0ECF7DDD749B1824CE98553E42E17"

  scope :open    , -> { where("state = 0") }
  scope :paid    , -> { where("state = 1") }
  scope :sent    , -> { where("state = 2") }
  scope :canceled, -> { where("state = 3") }

  def update_state state
    self.state = state.to_i
    save
  end

  def get_state
    Purchase::STATES[(self.state || 0)]
  end

  def update_address hash
    [:name, :address, :cellphone, :phone, :cep,
     :city, :complement, :uf, :number, :district].each do |field|
      write_attribute(field, hash[field])
    end

    save
  end

  def rid
    self.id.to_s.rjust(5, "0")
  end
  
  def discount
    return 0 if self.coupon.nil?
    
    d = self.coupon.value

    if self.coupon.discount_type = 0
      return self.subtotal * (d/100)
    else
      return d
    end
  end

  def subtotal
    self.purchase_items.sum(&:total)
  end

  def total
    self.subtotal - self.discount
  end
end
