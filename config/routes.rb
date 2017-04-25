Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root 'home#index'
  resources :events do
    resources :ads
  end
end
