class TicketRepply < ActiveRecord::Base
  attr_accessible :message, :ticket_id, :user_id

  belongs_to :user
  belongs_to :ticket

  validates_presence_of :message
  validates_length_of :message, within: 4..320
end