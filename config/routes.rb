Rails.application.routes.draw do

  resource :users do
    resource :articles
  end
  resource :articles do
    resource :comments, only: [:new, :create, :edit, :delete]
  end

  resource :sessions, only: [:new, :create, :destroy]

  delete '/log_out', to: 'sessions#destroy', as: :log_out
  get '/log_in', to: 'sessions#new', as: :log_in

  root 'articles#index'
end
