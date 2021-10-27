Rails.application.routes.draw do
  resources :questions
  devise_for :users
  resources :employees
  get 'home/index'
  #root 'home#index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
