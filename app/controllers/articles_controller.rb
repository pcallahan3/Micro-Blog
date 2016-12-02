#Implementing a new articles_controller
class ArticlesController < ApplicationController
  
  #new method to create a new article
  def new
    @article = Article.new
    
  end
  
  #create method to create a new article: doesnt require a view
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    #Redirecting to article_show path to render newly created article
    redirect_to articles_show(@article)
  end
  
  
  
  #
  private def article_params
    params.require(:article).permit(:title, :description)
  end
  
end