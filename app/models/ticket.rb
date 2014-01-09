class Ticket < ActiveRecord::Base
  attr_accessible :content, :state, :subject, :user_id

  belongs_to :user

  STATES = {
    0 => "Aberto",
    1 => "Fechado"
  }

  def open!
    update_attribute(:state, 0)
  end

  def close!
    update_attribute(:state, 1)
  end

  def get_state
    Ticket::STATES[(self.state || 0)]
  end
end
