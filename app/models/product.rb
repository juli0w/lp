class Product < ActiveRecord::Base
  mount_uploader :image, ProductUploader

  attr_accessible :category_id, :description, :name, :price,
                  :image, :image_cache, :color_ids, :size_ids

  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors

  belongs_to :category
end
