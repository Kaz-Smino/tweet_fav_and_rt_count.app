Rails.application.routes.draw do
  devise_for :users
  root 'root#index'
  get 'root/index'
  get 'tweet/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
