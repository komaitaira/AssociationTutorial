Rails.application.routes.draw do

  root 'tweets#index'
  devise_for :users
  # ================ここをネスト(入れ子)した形に変更
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
  #======================================
  # 親であるuserのidが欲しいため、usersの中にネストしましょう。
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
end
