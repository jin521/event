Rails.application.routes.draw do
  devise_for :users
  root :to => 'pages#home'
  resources :users
  resources :occasions
  get 'search' => 'occasions#search', as: 'search'
  get 'search_results' => 'occasions#search_results', as: 'search_results'
end
