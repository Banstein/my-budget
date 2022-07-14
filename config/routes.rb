Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "groups#index"

  resources :users, only: [:index]

  resources :groups, only: [:index, :new, :create, :destroy ] do
    resources :payments, only: %i[index new create destroy update]
  end
end
