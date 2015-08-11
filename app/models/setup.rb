class Setup < ActiveRecord::Base
  attr_accessible :emails
  
  def self.emails
    Setup.first.emails.split(",")
  end
end
