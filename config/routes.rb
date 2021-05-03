Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
