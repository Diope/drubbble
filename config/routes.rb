Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  devise_for :users, :controllers => { registrations: 'registrations'}

  root "posts#index"
end
