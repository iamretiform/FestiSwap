Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  # get 'hello_world', to: 'hello_world#index'
  put 'events/:event_id/ads/:id/delete_ad_file', to: 'ads#delete_ad_file', as: 'delete_ad_file'
  put 'events/:id/delete_event_file', to: 'events#delete_event_file', as: 'delete_event_file'
  put 'users/:id/delete_user_photo', to: 'application#delete_user_photo', as: 'delete_user_photo'
  root 'home#index'
  resources :events do
    resources :ads
  end
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end
end
