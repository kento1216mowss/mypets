class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def edit
    
  end
   
  def update
    current_user.update(update_params)
  end
  
  
  
  def update_params
    params.require(:user).permit(:nickname, :image)
  end
end

