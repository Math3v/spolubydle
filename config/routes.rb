Rails.application.routes.draw do
  resources :members

  resources :groups do
    resources :members
  end

  root 'groups#index'
end
