Rails.application.routes.draw do
  
  match 'answers/record' => 'answers#record', via: [:get, :post]

  resources :answers
  resources :choices
  resources :prompts
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  
end
