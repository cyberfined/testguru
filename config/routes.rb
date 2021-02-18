Rails.application.routes.draw do
  resources :tests do
    member do
      get :start
    end

    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  get '/signup', to: 'users#new'
  resources :users, only: :create

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
