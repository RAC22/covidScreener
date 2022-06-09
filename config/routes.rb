Rails.application.routes.draw do
  resources :guests
  resources :questions
  devise_for :users
  resources :employees
  get 'home/index'
  get 'home/landing'
  get 'home/launch'
  delete 'home/launch'
  get 'home/questionaire'
  post 'home/questionaire'
  get 'home/confirmation'
  get 'home/signoutt'
  get 'home/failed'
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
