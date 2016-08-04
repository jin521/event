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

  #get 'rsvp' => 'occasions#rsvp', as: 'rsvp'
  get '/rsvp/:occasion_id' => 'occasions#rsvp', as: 'rsvp'      #routing for Ajax only

  get '/unrsvp/:occasion_id' => 'occasions#unrsvp', as: 'unrsvp'   #routing for Ajax only
  get '/rsvp_toggle/:occasion_id' => 'occasions#rsvp_toggle', as: 'rsvp_toggle'

  get 'list_rsvps' => 'users#list_rsvps', as: 'list_rsvps'

end
