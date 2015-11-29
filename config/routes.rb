Rails.application.routes.draw do
  resources :tasks

  resources :members do
    resources :tasks, only: :index
  end

  resources :groups do
    resources :members, only: :index
    resources :tasks, only: :index
    member do
      get 'recalculate'
    end
  end

  root 'groups#index'
end
