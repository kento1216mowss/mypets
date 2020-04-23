class TweetsController < ApplicationController
  before_action :move_to_index , only: :new
  
  
    def index
      @tweets = Tweet.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end
    
    def show
      @tweet = Tweet.find(params[:id])
      
    end
    
    def new
     
    end
    
    def create
       @tweet = Tweet.new(image: permit_params[:image], text: permit_params[:text], user_id: current_user.id)
       @tweet.save!
       redirect_to action: 'index'
    end
    
    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id = current_user.id
        tweet.destroy
      end
    end

  private
    def permit_params
      params.require(:tweet).permit(:image, :text)
    end
    
    def move_to_index
      redirect_to action: :index unless user_signed_in?
      
    end
end  