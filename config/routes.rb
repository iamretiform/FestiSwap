Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :events do
    resources :ads
  end
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end
end
