Rails.application.routes.draw do
  constraints Subdomain do
    scope module: 'subdomain' do
      get '/', to: 'home#index', as: :our_root
      resources :projects, as: :our_projects
      resource :team, as: :our_team
    end
  end

  devise_for :users
  resources :teams, only: %i(index create new)
  root 'home#index'
end
