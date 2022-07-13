Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "groups#index"

  resources :users, only: [:index]

  resources :groups, only: [:index, :show, :new, :create] do
    resources :budgets, only: [:index, :show, :new, :create]
  end
end
