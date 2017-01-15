Rails.application.routes.draw do

  resource :users do
    resource :articles
  end
  resource :articles do
    resource :comments, only: [:new, :create, :edit, :delete]
  end

  resource :sessions, only: [:new, :create, :delete]

  root 'articles#index'
end
