class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_one :profile
  has_many :messages

  STATES = {
    0 => "Regular",
    1 => "Suspenso",
    2 => "Administrador"
  }

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
end
