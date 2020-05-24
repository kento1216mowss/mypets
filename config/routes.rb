
Rails.application.routes.draw do
 devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
 root 'tweets#index'
 resources :tweets do
    resources :comments, only: [:create]
 end
 resources :users do
  member do
      get :follow
      get :follower
      get :like
    end
  end
 post 'follow/:id' => 'relationships#follow', as: 'follow' 
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
 post "likes/:tweet_id/create", to: "likes#create", constraints: {food_id: /\d+/}, as: :likes_create
 post "likes/:tweet_id/delete", to: "likes#delete", constraints: {food_id: /\d+/}, as: :likes_delete
 get  'likes/:tweet_id/show', to: "likes#show"
end
