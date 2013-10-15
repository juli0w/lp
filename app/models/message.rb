class Message < ActiveRecord::Base
  attr_accessible :message, :read, :subject, :user_id

  belongs_to :user

  scope :unread, -> { where(read: false) }
  scope :read,   -> { where(read: true) }

  def mark_as_read!
    update_attributes(read: true)
  end
end
