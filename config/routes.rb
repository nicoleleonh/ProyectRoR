Rails.application.routes.draw do
  
  
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks"
    
  }

  resources :users, only: [:show]

  devise_for :admins, path: 'administrator', skip: [:registrations], controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    unlocks: 'admin/unlocks',
    confimations: 'admin/confimations'
  }


  resources :publications do
    resources :califications
  end
  
  namespace :admin do
    get '', to: 'dashboard#index'
    resources :reports, only: [:index]
    resources :admins
    resources :users
    resources :publications

  end

  root to: 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
