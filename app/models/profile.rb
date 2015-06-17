class Profile < ActiveRecord::Base
  attr_accessible :phone, :cellphone, :complement, :district,
                  :address, :cep, :city, :name, :number, :uf, :user_id

  belongs_to :user
  
  def get_purchase_address purchase
    [:name, :address, :cellphone, :phone, :cep,
      :city, :complement, :uf, :number, :district].each do |field|
      write_attribute(field, purchase[field]) if read_attribute(field).try(:empty?)  
    end
    
    save
  end
end
