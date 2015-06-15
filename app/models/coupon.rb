class Coupon < ActiveRecord::Base
  attr_accessible :discount_type, :expire_at, :name, :owner_id, :value, :active
  
  belongs_to :owner, class_name: "User"
  has_many :purchases
  
  scope :actives, -> { where(active: true) }
  scope :not_expired, -> { where("expire_at > ?", DateTime.now) }
  
  TYPES = {
    "%" => 0,
    "R$" => 1
  }
  
  def self.active? code
    c = Coupon.actives.not_expired.where(name: code)
    
    c.any?
  end
  
  def get_type
    Coupon::TYPES[(self.discount_type || 0)]
  end
  
  def get_value
    self.discount_type == 0 ? "#{self.value}%" : "R$ #{self.value}"
  end
  
  def owner_link
    self.owner || ""
  end
  
  def owner_name
    self.owner.try(:get_name) || ""
  end
end
