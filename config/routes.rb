Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'transactions#index'
  resources :transactions, only: :index do
    collection do
      get :new_deposit
      get :new_withdraw
      get :new_transfer
      get :accounts

      post :deposit
      post :withdraw
      post :transfer
    end
  end
end
