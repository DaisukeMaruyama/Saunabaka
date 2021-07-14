Rails.application.routes.draw do

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
      
      resources :facilities, only: [:index, :show, :edit, :new, :create, :update] do
        resource :favorites, only: [:create, :destroy] do
          delete :userFavoriteDelete
        end
      end

      resources :users, only: [:show, :edit, :update] do
        patch :change_password
        get :newpassword
        put :withdraw
        get :unsubscribe
        get :favorites, on: :collection
      end
    
      resources :forums, only: [:index, :show, :edit, :new, :create, :destroy]

      resources :topics, only: [:index, :show, :edit, :new, :create, :destroy]

      resources :recommendations, only: [:index, :show, :edit, :new, :create, :destroy, :update]

      #お問い合わせ
      resources :contacts, only: [:new, :create]
      post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
      post 'contacts/back', to: 'contacts#back', as: 'back'
      get 'done', to: 'contacts#done', as: 'done'

    end
    
    
    namespace :admin do
      resources :facilities, only: [:index, :show, :create, :edit, :new, :destroy]
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
