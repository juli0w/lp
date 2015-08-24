class Category < ActiveRecord::Base
  include ActsAsTree
  attr_accessible :name, :parent_id, :active, :alternative_id, :level

  scope :actives, -> { where(active: true) }
  scope :gots, -> { joins(:items).group('categories.alternative_id').having('count(items.id) > 0') }

  acts_as_tree order: "id"

  has_many :items
  
  def self.import familias, grupos, subgrupos
    ImportationEngine.import(familias, grupos, subgrupos)

    return true
  end
  
  def most_popular
    self.children.gots.actives.to_a.sort_by {|e| e.items.size}.reverse.first(15)
  end
  
  def as_setupable
    { name: self.name,
        id: self.id,
      size: self.items.size,
      children: [] }
  end
  
  def self.reload
    categories = []
    Category.roots.where(active: true).each do |category_root|
      if category_root.children.any?
        c = category_root.as_setupable
        category_root.children.actives.first(3).each do |category|

          c2 = category.as_setupable
          
          category.most_popular.each do |subcategory|
            c3 = subcategory.as_setupable
            c2[:children] << c3
          end
          
          c[:children] << c2
        end
      end
      
      categories << c
    end
    
    return categories
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
