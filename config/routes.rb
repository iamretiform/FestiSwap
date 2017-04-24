Rails.application.routes.draw do
  root 'home#index'
  resources :events do
    resources :ads
  end
end
