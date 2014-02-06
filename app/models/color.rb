# encoding: UTF-8
class Color < ActiveRecord::Base
  attr_accessible :code, :name, :category_id

  has_and_belongs_to_many :products

  scope :automotivas, -> { where(category_id: 0) }
  scope :imobiliarias, -> { where(category_id: 1) }

  CATEGORIES = [
    ['AUTOMOTIVA', 0],
    ['IMOBILIÁRIA', 1]
  ]

  def category
    category_id.to_i == 1 ? "IMOBILIÁRIA" : "AUTOMOTIVA"
  end
end
