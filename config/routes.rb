Rails.application.routes.draw do
  constraints Subdomain do
    scope module: 'subdomain' do
      get '/', to: 'home#index', as: :subdomain_root
    end
  end

  devise_for :users
  resources :teams, only: %i(index create new)
  root 'home#index'
end
