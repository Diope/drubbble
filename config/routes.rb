Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controller => { registrations: 'registrations'}
  root "posts#index"
end
