Rails.application.routes.draw do
  constraints Subdomain do
    scope module: 'subdomain' do
      get '/', to: 'home#index', as: :our_root
      resources :timelines, only: :index
      resources :activities, only: :index
      resources :projects, as: :subdomain_projects do
        resource :transaction, only: %i(create destroy)
      end
      resource :team, as: :our_team
      resources :users, only: %i(index show)
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  resource :report, only: :show
  resources :teams, only: %i(index create new)
  resources :projects do
    resource :transaction, only: %i(create destroy), controller: 'projects/transactions'
  end
  resources :transactions, only: %i(edit update)
  resources :notes, only: %i(index edit create update destroy)
  resources :timelines, only: :index
  resources :users, only: :show
  root 'home#index'
end
