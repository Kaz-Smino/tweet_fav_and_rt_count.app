Rails.application.routes.draw do
  devise_for :users
  get '/', to: redirect('/tweet/index')
  root 'root#index'
  get 'root/index', to: redirect('/users/sign_in')
  get 'tweet/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
