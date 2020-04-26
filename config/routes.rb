
Rails.application.routes.draw do
 devise_for :users
 root 'tweets#index'
 resources :tweets do
    resources :comments, only: [:create]
 end
 resources :users, only: [:show, :edit, :update]
 post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
