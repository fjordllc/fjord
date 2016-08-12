Rails.application.routes.draw do
  constraints Subdomain do
    scope module: 'subdomain' do
      get '/', to: 'home#index', as: :our_root
      resources :timelines, only: :index
      resources :projects, as: :subdomain_projects do 
        resource :transaction, only: %i(create destroy)
      end
      resource :team, as: :our_team
    end
  end

  devise_for :users
  resources :teams, only: %i(index create new)
  resources :projects do
    resource :transaction, only: %i(create destroy)
  end
  resources :timelines, only: :index
  root 'home#index'
end
