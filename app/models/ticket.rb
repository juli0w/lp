class Ticket < ActiveRecord::Base
  attr_accessible :content, :state, :subject, :user_id

  belongs_to :user
  has_many :ticket_repplies, dependent: :destroy

  STATES = {
    0 => "Aberto",
    1 => "Fechado"
  }

  def open!
    update_attribute(:state, 0)
    self
  end

  def close!
    update_attribute(:state, 1)
    self
  end

  def open?; self.state == 0 end

  def get_state
    Ticket::STATES[(self.state || 0)]
  end

  def rid
    self.id.to_s.rjust(5, "0")
  end
end