class Purchase < ActiveRecord::Base
  attr_accessible :address, :cellphone, :cep, :city, :complement,
                  :number, :phone, :uf, :user_id, :district

  belongs_to :user
  has_many :purchase_items

  STATES = {
    0 => "Aguardando pagamento",
    1 => "Pagamento confirmado",
    2 => "Produtos enviados",
    3 => "Cancelado"
  }

  TOKEN = "B3F0ECF7DDD749B1824CE98553E42E17"

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
    [:address, :cellphone, :phone, :cep,
     :city, :complement, :uf, :number, :district].each do |field|
      write_attribute(field, hash[field])
    end

    save
  end

  def rid
    self.id.to_s.rjust(5, "0")
  end

  def subtotal
    self.purchase_items.sum(&:total)
  end

  def total
    subtotal
  end
end
