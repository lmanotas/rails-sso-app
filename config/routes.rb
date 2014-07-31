Rails.application.routes.draw do

  devise_for :users

  use_doorkeeper

  root 'pages#index'

  get '/me' => 'users#me'

end
