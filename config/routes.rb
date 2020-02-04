Rails.application.routes.draw do
  root 'spots#index'
  resources :spots do
    collection do
      get 'search'
    end
    resources :reviews
  end
  resources :users
end