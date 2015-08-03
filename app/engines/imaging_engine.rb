class ImagingEngine
  def self.load!
    Dir.glob('db/images/*').map do |f|
      item = Item.where(id: File.basename(f, ".jpg")).first
      
      unless item.blank?
        item.image = Rails.root.join(f).open
        item.save!
        item.image.recreate_versions!
      end
    end
  end
end