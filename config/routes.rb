Rails.application.routes.draw do
  root :to => 'pages#home'

  devise_for :users, path_names: {sign_in: "login", sign_out: "log_out"}, controllers: {omniauth_callbacks: "omniauth_callbacks"} 
  resources :occasions
  resources :users

  get 'auth/twitter', as: "auth_provider"
  get 'auth/twitter/callback', to: 'users#login'

  get 'feeds/index'
  get 'feeds/show'
  get '/feed' => 'feeds#index'

  get 'search' => 'occasions#search', as: 'search'
  get 'search_results' => 'occasions#search_results', as: 'search_results'
end
