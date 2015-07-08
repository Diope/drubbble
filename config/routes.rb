Rails.application.routes.draw do
  resources :posts
<<<<<<< HEAD
  devise_for :users, :controllers => { registrations: 'registrations'}
=======
  devise_for :users, :controller => { registrations: 'registrations'}
>>>>>>> add_username
  root "posts#index"
end
