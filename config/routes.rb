Rails.application.routes.draw do

  get 'occasions/index'

  get 'occasions/new'

  get 'occasions/edit'

  get 'occasions/show'

  root :to => 'pages#home'
  resources :users
  resources :occasions

end
