# encoding: UTF-8
require 'spec_helper'

describe 'Cart' do
  let(:products) do
    10.times.map do
      FactoryGirl.create(:product)
    end
  end

  before(:all)  { products }
  before(:each) { visit root_path }

  context 'Empty cart' do
    it 'is empty' do
      click_on 'Carrinho'

      page.should have_content('O carrinho está vazio')
    end
  end

  context 'Managing cart' do
    it 'adds a product' do
      within("#product-#{products.first.id}") do
        click_on 'Comprar'
      end

      click_on 'Carrinho'

      page.should have_content(products.first.name)
    end

    it 'calculates total as the product price' do
      click_on 'Carrinho'
      
      within("#total") do
        page.should have_content(number_to_currency(products.first.price, unit: "R$ ", separator: ","))
      end
    end
  end
end