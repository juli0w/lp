class Setup < ActiveRecord::Base
  attr_accessible :emails, :categories
  
  def self.setup
    @setup ||= Setup.first
  end
  
  def self.categories
    refresh_categories if setup.categories.blank?
    setup.categories
  end
  
  def self.emails
    setup.emails.split(",")
  end
  
  def self.refresh_categories
    setup.categories = Category.reload
    setup.save
  end
end
