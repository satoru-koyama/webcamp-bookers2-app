Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about', to: 'homes#about'
  resources :books
  resources :users, except: [:destroy, :new, :create]
  
end
