Rails.application.routes.draw do
  devise_for :users, :path => 'accounts', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  root :to => 'pages#home'

  resources :occasions
  resources :users

  get 'feeds/index'
  get 'feeds/show'
  get '/feed' => 'feeds#index'

  get 'search' => 'occasions#search', as: 'search'
  get 'search_results' => 'occasions#search_results', as: 'search_results'
end
