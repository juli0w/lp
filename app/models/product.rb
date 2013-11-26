class Product < ActiveRecord::Base
  mount_uploader :image, ProductUploader

  attr_accessible :category_id, :description, :name, :price,
                  :image, :image_cache, :color_ids,
                  :product_sizes_attributes

  has_and_belongs_to_many :colors
  has_many :product_sizes

  belongs_to :category

  accepts_nested_attributes_for :product_sizes
end