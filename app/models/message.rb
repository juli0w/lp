class Message < ActiveRecord::Base
  attr_accessible :message, :read, :subject, :user_id

  belongs_to :user
end
