Rails.application.routes.draw do
  constraints Subdomain do
    scope module: "subdomain" do
      get "/", to: "home#index", as: :our_root
      resources :timelines, only: :index
      resources :activities, only: :index
      resources :companies
      resources :projects, as: :subdomain_projects do
        resource :transaction, only: %i(create destroy)
      end
      resource :team, as: :our_team
      resources :users, only: %i(index show)
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  get "/:date", to: "home#index", constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: :root_with_date
  resources :reports, only: :index
  namespace :reports do
    resources :months, only: :index
    resources :dailies, only: :index
  end
  resources :teams, only: %i(index create new)
  resources :projects do
    resource :transaction, only: %i(create destroy), controller: "projects/transactions"
  end
  resources :transactions, only: %i(edit update destroy)
  resources :notes, only: %i(index edit create update destroy)
  resources :comments, only: %i(create new edit update destroy)
  resources :timelines, only: :index
  resources :users, only: :show
  get "/users/:id/:date", to: "users#show", constraints: { date: /\d{4}-\d{2}-\d{2}/ }, as: :user_with_date
end
