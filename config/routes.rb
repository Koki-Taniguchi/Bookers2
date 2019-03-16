Rails.application.routes.draw do
  devise_for :users
  root 'users#top'
  get 'about', to: 'users#about'
  resources :books, only: [:create, :update, :destroy, :index, :show, :edit]
  resources :users, only: [:top, :about, :show, :update, :index, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
