class Message < ActiveRecord::Base
  attr_accessible :message, :read, :subject, :user_id

  belongs_to :user

  scope :unread, -> { where(read: false) }
  scope :read,   -> { where(read: true) }

  def mark_as_read!
    update_attributes(read: true)
  end

  def self.send_to_admins message
    return false if message[:name].blank? or message[:email].blank? or message[:message].blank?

  	User.admins.each do |user|
      Message.create({
        message: "Nome: #{message[:name]}
        <br />Email: #{message[:email]}
        <br />Mensagem: #{message[:message]}",
        user_id: user.id,
        subject: "Contato"})
    end

    return true
  end
end
