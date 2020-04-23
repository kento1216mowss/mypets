Rails.application.routes.draw do
 devise_for :users
 root 'tweets#index'
 resources:tweets, only: [:index,:new,:show]
 post  '/create'   =>  'tweets#create' 
 delete 'tweets/:id' => 'tweets#destroy'
 get 'users/:id' => 'users#show'
 

end
