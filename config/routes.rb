Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # resources :auths, only: [:create]
  resources :kinds

  api_version(:module => "v1", :header => {:name => "Accept", :value => "application/vnd.api+json; version=1"}) do
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
  end

  api_version(:module => "v2", :header => {:name => "Accept", :value => "application/vnd.api+json; version=2"}) do
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
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
