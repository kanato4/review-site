Rails.application.routes.draw do
  root 'spots#index'

  resources :spots do
    collection do
      get 'search'
    end
    resources :reviews
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'signup'
  } 

  resources :users, only: [:index, :edit, :show, :destroy], path: "/mypage"

  resources "signup", only: [:index, :create], path: "/signup" do
    collection do
      get 'user_info'
      post 'user_tel'
      post 'user_tel_verification'
      get 'user_complete'
    end
  end
end