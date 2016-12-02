#Implementing a new articles_controller
class ArticlesController < ApplicationController
  
  #new method to create a new article
  def new
    @article = Article.new
    
  end
  
   def show
    @article = Article.find(params[:id])
  end
  
  #create method to create a new article: doesnt require a view
  def create
    @article = Article.new(article_params)
    
    #If article is successfully saved render message and redirect to article_show path to render newly created article
    #Else re-render the 'new' view again
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
 
  
  
  
  #
  private def article_params
    params.require(:article).permit(:title, :description)
  end
  
end