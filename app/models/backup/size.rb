class Size < ActiveRecord::Base
  attr_accessible :code, :name, :price

  has_and_belongs_to_many :products
end