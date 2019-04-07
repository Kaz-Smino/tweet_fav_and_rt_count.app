Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'tweet#index'
  root 'root#index'
  get 'root/index', to: redirect('/users/sign_in')
  get 'tweet/index'
  

  get 'tweet/timeline'
  get 'tweet/followers_count'
  get 'tweet/about'

  root :to => "top#index"

  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
