Rails.application.routes.draw do
  
  match 'answers/record' => 'answers#record', via: [:get, :post]
  match 'pages/word_cloud/:id' => 'pages#word_cloud', via: [:get]
  match 'pages/bar_chart/:id' => 'pages#bar_chart', via: [:get]
  match 'prompts/set_active/:id' => 'prompts#set_active', via: [:get, :post]
  
  resources :answers
  resources :choices
  resources :prompts, :has_many => :choices
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  
end
