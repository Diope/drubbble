Rails.application.routes.draw do

  resources :profile, only: [:show, :index, :update, :edit]
  resources :posts do
    resources :comments
  end


  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, only: [:show]
  
  root "posts#index"
end
