Rails.application.routes.draw do
  resources :posts, except: %i[destroy]
  root "posts#index"
end
