Rails.application.routes.draw do


  resources :users, only: [:new, :show, :create, :destroy] do
  end
  resources :articles, only: [:new, :index, :create, :show, :edit, :destroy, :update] do
    resources :comments, only: [:new, :create, :update, :edit, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

  delete '/log_out', to: 'sessions#destroy', as: :log_out
  get '/log_in', to: 'sessions#new', as: :log_in

  root 'articles#index'
end
