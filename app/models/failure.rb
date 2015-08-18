class Failure < ActiveRecord::Base
  attr_accessible :message, :name, :backtrace, :state,
                  :details, :request
  
  scope :opened, -> { where(state: false) }
  scope :closed, -> { where(state: true) }
end
