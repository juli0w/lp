Lojadopintor::Application.routes.draw do
  get "oops", to: "failures#index"
  resources :failures, only: [:show, :index] do
    collection do
      get :closed
    end
    
    member do
      get :close
    end
  end

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :users

  get "dashboard/index"
  get "dashboard/profile"

  get "admin/index"
  get "admin/setup"
  
  resources :setup, only: [:update]

  get "home/index"
  get "home/contact"

  get "/simulador/resicolor", action: 'resicolor', controller: 'home'
  get "/simulador/metalatex", action: 'metalatex', controller: 'home'
  
  # -
  # - CART
  # -

  get "cart/index"
  get "cart/clean"
  put "cart/update"
  put "cart/coupon"
  get "cart/shipping"
  put "cart/remove/:sku",    action: :remove, controller: :cart, as: "remove_cart"
  get "cart/payment/:token", action: :payment, controller: :cart, as: "payment_cart"
  post "cart/purchase"

  # -

  get "profile/edit"
  
  namespace :report do
    resources :coupon, only: [:index] do
      collection do
        get :by_coupons
      end
      
      member do
        get :by_coupon
      end
    end
  end

  resources :users do
    member do
      put :ban
      put :unban
      put :permit
    end

    collection do
      post :filter
    end
  end

  resources :profile
  resources :cache_products
  resources :purchases do
    member do
      put :change
      get :print
    end

    collection do
      get :canceled
      get :open
      get :paid
      get :sent
    end
  end

  resources :messages do
    collection do
      post 'contact'
    end
  end

  resources :tickets do
    collection do
      get 'list'
    end

    member do
      get 'open'
      get 'close'
    end

    resources :ticket_repplies, only: :create
  end
  
  # resources :colors
  # resources :sizes
  
  resources :coupons

  resources :categories do
    collection do
      get :importation
      post :import
      delete :format
    end
  end

  resources :pages, except: :show do
    collection do
      get :importation
      post :import
    end
  end
  
  get "pages/:slug", controller: :pages, action: :show

  # resources :products do
  #   member do
  #     post :add_to_cart
  #   end
  #   collection do
  #     get :search
  #     post :filter
  #   end
  # end

  resources :items do
    member do
      post :add_to_cart
    end
    collection do
      get :search
      post :filter
      get :importation
      post :import
      delete :format
    end
  end

  root to: "home#index"
end