class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :profile
  has_many :messages
  has_many :purchases
  has_many :tickets
  has_many :coupons

  STATES = {
    0 => "Regular",
    1 => "Suspenso",
    2 => "Administrador"
  }

  scope :admins,    -> { where(state: 2) }
  
  def self.admin
    where(state: 2).first
  end
  
  def get_purchase_address purchase
    self.profile.get_purchase_address purchase
  end

  def unban!
    update_attribute(:state, 0)
  end

  def ban!
    update_attribute(:state, 1)
  end

  def permit!
    update_attribute(:state, 2)
  end

  def get_state
    User::STATES[(self.state || 0)]
  end

  def admin?
    self.state == 2
  end

  def get_name
    self.profile.try(:name).nil? ? self.email : self.profile.name
  end
end
