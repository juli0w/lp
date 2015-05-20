class Category < ActiveRecord::Base
  include ActsAsTree
  attr_accessible :name, :parent_id, :active, :alternative_id, :level

  scope :actives, -> { where(active: true) }
#  scope :got, -> { where(self.items.size > 0) }

  acts_as_tree order: "id"

  has_many :items

  def self.import familias, grupos, subgrupos
    ImportationEngine.import(familias, grupos, subgrupos)

    return true
  end

  def self.load_products id
    categories = [id.to_i]

    self.find(id).children.each do |c|
      categories << c.id

      c.children.each do |sc|
        categories << sc.id
      end
    end

    items = []

    categories.each {|c| items = items + self.find(c).items }

    return items.uniq
  end
end
