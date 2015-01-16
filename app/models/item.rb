class Item < ActiveRecord::Base
  mount_uploader :image, ProductUploader

  attr_accessible :external_id, :um, :category_id, :description, :name, :price,
                  :image, :image_cache, :active

  scope :actives, -> { where(active: true) }

  default_scope where(active: true)

  belongs_to :category

  def self.import itens
    return ImportationEngine.import_itens(itens)
  end
end