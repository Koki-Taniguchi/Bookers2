Rails.application.routes.draw do
  devise_for :users
  root 'users#top'
  get 'about', to: 'users#about'
  resources :books, only: [:create, :update, :destroy, :index, :show, :edit] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :update, :index, :edit] do
    resource :follows, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
