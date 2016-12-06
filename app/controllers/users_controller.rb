class UsersController < ApplicationController
  
  def new 
    @user = User.new
  end
  
  #Creating new user and displaying welcome message and redirecting back to articles path
  def create
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "Welcome to the Micro Blog #{@user.username}"
     redirect_to articles_path
   else
     render 'new'
  end
end
  
  #Whitelisting the parameters that need to be included
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
