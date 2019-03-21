Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'root#index'
  root 'root#index'
  get 'root/index', to: redirect('/users/sign_in')
  get 'tweet/index'

  get 'tweet/timeline'
  get 'tweet/followers_count'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
