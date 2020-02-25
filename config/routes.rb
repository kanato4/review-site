Rails.application.routes.draw do

  root 'reviews#index'

  resources :reviews do
    collection do
      get 'search'
    end
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'signup'
  } 

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources "signup", only: [:index, :create], path: "/signup" do
    collection do
      get 'user_info'
      post 'user_tel'
      post 'user_tel_verification'
      get 'user_complete'
    end
  end

  resources :users, only: [:index, :edit, :show], path: "/mypage"
end