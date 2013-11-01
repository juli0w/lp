class Size < ActiveRecord::Base
  attr_accessible :code, :name

  has_and_belongs_to_many :products
end
