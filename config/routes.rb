Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :answers, only: :show

  resources :questions, only: :show

  resources :tests, only: %i[index show] do
    member do
      get :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  post '/gists/:test_passage_id', to: 'gists#create', as: 'gists'

  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index
  end
end
