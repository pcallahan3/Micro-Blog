#Implementing a new articles_controller
class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  #new method to create a new article
  def new
    @article = Article.new
    
  end
  
  #edit method that finds the article id to edit
  def edit
    @article = Article.find(params[:id])
  end
  
   #show method that finds the id of article to show
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
  
  #update action to update article, if succesful render message, else rended edit template again
  def update
    @article = Article.find(params[:id])  
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  
 
  
  #whitelisted parameters that must be included in CRUDing a article
  private def article_params
    params.require(:article).permit(:title, :description)
  end
  
end