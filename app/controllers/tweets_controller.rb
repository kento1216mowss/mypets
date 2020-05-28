class TweetsController < ApplicationController
  before_action :move_to_index , except: :idnex
  
   
    def index
      @tweets = Tweet.all.includes(:user).order("created_at DESC").page(params[:page]).per(12)
      @posts = User.search(params[:search])

    end
    
    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
    end
    
    def new
      @tweet = Tweet.new
    end
    
    def create
       @tweet = Tweet.create(image: permit_params[:image], text: permit_params[:text], user_id: current_user.id)
       if @tweet.save
        redirect_to action: 'index'
       else
        redirect_to "/tweets/new" 
       end  
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