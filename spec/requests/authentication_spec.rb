# encoding: UTF-8
require 'spec_helper'

describe 'Authentication' do
  let(:user) { FactoryGirl.create(:user) }

  context 'Log in' do
    it 'does not login with an incorrect password' do
      login 'user@email.com', '123123'

      page.should have_content('Invalid email or password')
    end

    it 'logs in with a correct user' do
      login user.email, user.password

      page.should have_content('Signed in successfully')
    end
  end

  context 'Log out' do
    before { login user.email, user.password }

    it 'logs out successfully' do
      click_on 'Minha conta'
      click_on 'Sair'
      
      page.should have_content('Signed out successfully')
    end
  end
end