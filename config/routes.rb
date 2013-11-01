Lojadopintor::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :users

  get "dashboard/index"
  get "dashboard/profile"

  get "admin/index"

  get "home/index"
  get "home/contact"

  # -
  # - CART
  # -

  get "cart/index"
  get "cart/clean"
  put "cart/update"
  get "cart/shipping"
  put "cart/remove/:id",     action: :remove, controller: :cart, as: "remove_cart"
  get "cart/payment/:token", action: :payment, controller: :cart, as: "payment_cart"
  post "cart/purchase"

  # -

  get "profile/edit"

  resources :users do
    member do
      put :ban
      put :unban
      put :permit
    end
  end

  resources :profile
  resources :purchases do
    member do
      put :change
    end

    collection do
      get :canceled
      get :open
      get :paid
      get :sent
    end
  end

  resources :messages
  resources :colors
  resources :sizes
  resources :categories
  resources :pages, except: :show
  get "pages/:slug", controller: :pages, action: :show

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