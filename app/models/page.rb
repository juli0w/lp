# encoding: UTF-8
class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :content, :slug, :title, :page_type

  TYPES = { "Página"  => 0,
            "Notícia" => 1,
            "Empresa" => 2 }

  scope :pages,   -> { where(page_type: 0) }
  scope :notices, -> { where(page_type: 1) }
  scope :company, -> { where(page_type: 2) }

  def page_type_name
    TYPES.each do |name, type|
      return name if type == self.page_type
    end
  end
  
  def self.from_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      page = find_by_id(row["id"]) || new
      page.attributes = row.to_hash.slice(*accessible_attributes)
      page.save!
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
