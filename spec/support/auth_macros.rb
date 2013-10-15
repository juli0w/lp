module AuthMacros
  def login(email=nil, password=nil)
    visit root_path
    click_on "Login"

    fill_in "login-username", with: (email || Default::EMAIL)
    fill_in "login-password", with: (password || Default::PASSWORD)
    
    click_button "Login"
  end
end