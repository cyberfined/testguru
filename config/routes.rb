Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

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
end
