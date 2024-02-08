Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'custom_registrations' }
  resources :posts
  root "posts#index"
  get 'about', to: 'posts#about'
end
