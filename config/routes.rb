Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles
end
