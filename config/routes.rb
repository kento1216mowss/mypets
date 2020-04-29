
Rails.application.routes.draw do
 devise_for :users
 root 'tweets#index'
 resources :tweets do
    resources :comments, only: [:create]
 end
 resources :users, only: [:show, :edit, :update]
 post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
 post "likes/:tweet_id/create", to: "likes#create", constraints: {food_id: /\d+/}, as: :likes_create
 post "likes/:tweet_id/delete", to: "likes#delete", constraints: {food_id: /\d+/}, as: :likes_delete
 get  'likes/:tweet_id/show', to: "likes#show"
end
