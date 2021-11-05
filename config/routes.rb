Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user, only: [:index, :show, :edit, :update]
  resources :book, only: [:index, :show, :edit, :create, :update, :destroy]

end
