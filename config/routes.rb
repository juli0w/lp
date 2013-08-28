Lojadopintor::Application.routes.draw do
  devise_for :users

  get "dashboard/index"
  get "dashboard/profile"

  get "admin/index"

  get "home/index"
  get "cart/index"

  get "profile/edit"

  resources :users do
    member do
      put :ban
      put :unban
      put :permit
    end
  end

  resources :profile
  resources :categories
  resources :products

  root to: "home#index"
end