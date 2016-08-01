Rails.application.routes.draw do
  get 'feeds/index'

  get 'feeds/show'

  devise_for :users
  root :to => 'pages#home'
  resources :users
  resources :occasions
  get '/feed' => 'feeds#index'

end
