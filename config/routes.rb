Rails.application.routes.draw do
  devise_for :users

  root 'splash#index'
  resources :splash, only: [:index]

  resources :groups, only: [:index, :new, :create, :destroy ] do
    resources :payments, only: %i[index new create destroy update]
  end
end
