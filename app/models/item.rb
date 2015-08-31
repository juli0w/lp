class Item < ActiveRecord::Base
  mount_uploader :image, ProductUploader

  attr_accessible :external_id, :um, :category_id, :description, :name, :price,
                  :image, :image_cache, :remote_image_url, :active, :slug

  scope :actives, -> { where(active: true) }

  belongs_to :category
  
  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  
  def to_param
    slug
  end
  
  def self.update_images
    Item.all.each { |i| i.image.recreate_versions! unless i.image.blank? }
  end

  def self.import itens
    return ImportationEngine.import_itens(itens)
  end
  
  def generate_slug
    return if self.slug.present?
    
    sl = self.name.parameterize
    t = 0
    while Item.where(slug: sl).count > 0 do
      t += 1
      sl = "#{self.name.parameterize}-#{t}"
    end
    
    self.slug = sl
  end
end