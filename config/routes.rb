Rails.application.routes.draw do
  resources :questions
  devise_for :users
  resources :employees
  get 'home/index'
  get 'home/landing'
  get 'home/launch'
  get 'home/questionaire'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
