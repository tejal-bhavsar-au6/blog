class ArticlesController < ApplicationController
   
  def index
    @articles = Article.all
  end
      
  def show
    @article = Article.find(params[:id])
  end
      
      
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
  
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    @article.user = current_user
    @article.save
  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path
  end     
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
     user == "dhh" && password ==  "secrete"
    end   
  end
   
end