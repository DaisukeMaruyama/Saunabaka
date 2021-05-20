Rails.application.routes.draw do

  get 'topics/index'
  get 'topics/show'
  get 'topics/create'
  get 'topics/destroy'
  get 'topics/edit'
  #devise関連
    devise_for :users, :controllers => {
      :registrations => 'devise/users/registrations',
      :sessions => 'devise/users/sessions',
      :passwords => 'devise/users/passwords'
    }
    
    devise_scope :user do
      get "user/:id", :to => "users/registrations#detail"
      get "signup", :to => "users/registrations#new"
      get "login", :to => "users/sessions#new"
      get "logout", :to => "users/sessions#destroy"
      get "password", :to => "users/passwords#new"
    end
    
  #Top画面
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'
    
    #scope module: :public doでpublicフォルダへまとめる。※URLにpublicがつくことはない
    scope module: :public do
      
      resources :facilities, only: [:index, :show, :edit, :new, :create, :destroy]
    
      resources :forums, only: [:index, :show, :edit, :new, :create, :destroy]
    end
    
    namespace :admin do
      resources :facilities, only: [:index, :show, :create, :edit, :new, :destroy]
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
