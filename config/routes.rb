Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :auths, only: [:create]
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'realationships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'realationships/phones'
    resource :phone, only: [:update, :create, :destroy]
    resource :phone, only: [:show], path: 'realationships/phone'

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'realationships/address'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
