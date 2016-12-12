class UsersController < ApplicationController
  
  #Index method with pagination for 5 users per page
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  
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

  #show method to find the user whose  id based on it 
  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You sucessfully updated your account"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  #Whitelisting the parameters that need to be included
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
