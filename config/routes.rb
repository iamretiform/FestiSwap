Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', :passwords => "passwords" }
  # get 'hello_world', to: 'hello_world#index'
  root 'home#index'
  resources :events do
    resources :ads
  end
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end
end
