Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  devise_for :users
  root to: 'posts#index'
  patch '/posts/:id/like', to: 'posts#like', as: 'like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
