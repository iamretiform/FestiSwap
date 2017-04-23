Rails.application.routes.draw do
  root 'home#index'
  resources :events do
    resources :ads
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
