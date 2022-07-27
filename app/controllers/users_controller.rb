class UsersController < ApplicationController
  def index
    @users= User.all #ユーザーも出るからユーザーの情報をすべて取る
  end

  def show
    @user = User.find(params[:id]) #urlからidをとってくる仕組み
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user)
  end
   
   private
   def user_params
     params.require(:user).permit(:username, :email, :profile, :profile_image)
   end
end
