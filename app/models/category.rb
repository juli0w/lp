class Category < ActiveRecord::Base
  include ActsAsTree
  attr_accessible :name, :parent_id

  acts_as_tree order: "id"

  has_many :products
end
