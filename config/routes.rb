Rails.application.routes.draw do
  resources :tests do
    resources :questions, except: %i[index], shallow: true
  end
end
