class Item < ActiveRecord::Base
  mount_uploader :image, ProductUploader

  attr_accessible :external_id, :um, :category_id, :description, :name, :price,
                  :image, :image_cache, :remote_image_url, :active

  scope :actives, -> { where(active: true) }

  default_scope where(active: true)

  belongs_to :category
  
  def self.update_images
    Item.all.each { |i| i.image.recreate_versions! }
  end

  def self.import itens
    return ImportationEngine.import_itens(itens)
  end
end