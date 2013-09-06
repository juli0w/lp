class Category < ActiveRecord::Base
  include ActsAsTree
  attr_accessible :name, :parent_id

  acts_as_tree order: "id"

  has_many :products

  def self.load_products id
    categories = [id.to_i]

    self.find(id).children.each do |c|
      categories << c.id

      c.children.each do |sc|
        categories << sc.id
      end
    end

    products = []

    categories.each {|c| products = products + self.find(c).products }

    return products.uniq
  end
end
