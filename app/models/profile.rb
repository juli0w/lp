class Profile < ActiveRecord::Base
  attr_accessible :phone, :cellphone, :complement, :district,
                  :address, :cep, :city, :name, :number, :uf, :user_id

  belongs_to :user
end
