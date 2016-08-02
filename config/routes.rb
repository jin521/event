Rails.application.routes.draw do
  get 'feeds/index'

  get 'feeds/show'

  devise_for :users
  root :to => 'pages#home'
  resources :users
  resources :occasions

  get '/feed' => 'feeds#index'


  get 'search' => 'occasions#search', as: 'search'
  get 'search_results' => 'occasions#search_results', as: 'search_results'

end
