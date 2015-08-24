class Setup < ActiveRecord::Base
  serialize :categories, Hash
  attr_accessible :emails, :categories
  
  def self.setup
    @setup ||= Setup.first
  end
  
  def self.categories
    refresh_categories if setup.categories.blank?
    setup.categories[:tree]
  end
  
  def self.emails
    setup.emails.split(",")
  end
  
  def self.refresh_categories
    setup.categories = {tree: Category.reload}
    setup.save
  end
end
