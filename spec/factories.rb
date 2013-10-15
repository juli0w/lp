require 'spec_helper'

FactoryGirl.define do
  sequence(:email) { |n| "user_#{n}@lp.com" }
  
  factory :user do
    email    { generate :email }
    password { Default::PASSWORD }

    factory :default_user do
      email  { Default::EMAIL }
    end
  end

  factory :product do
    sequence(:name)  { |n| "product-#{n}" }
    sequence(:price) { |n| n*10 }
  end
end