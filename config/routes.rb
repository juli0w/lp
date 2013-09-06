Lojadopintor::Application.routes.draw do
  devise_for :users

  get "dashboard/index"
  get "dashboard/profile"

  get "admin/index"

  get "home/index"
  get "cart/index"

  get "profile/edit"

  get "cart/clean"
  resources :cart

  resources :users do
    member do
      put :ban
      put :unban
      put :permit
    end
  end

  resources :profile
  resources :messages
  resources :categories
  resources :products do
    member do
      get :add_to_cart
    end
    collection do
      get :search
    end
  end

  root to: "home#index"
end