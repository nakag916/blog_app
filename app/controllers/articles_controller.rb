class ArticlesController < ApplicationController
  before_action :logged_in_user, except: :show
  before_action :correct_user_article, only: :destroy
  PER = 10

  def index
    @articles = current_user.articles.page(params[:page]).per(PER)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "New artilcle created!"
      redirect_to articles_path
    else
      flash[:danger] = "Failed to creat new article"
      redirect_to new_article_path
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_to request.referrer || root_url
  end

  def show
    #データベースから最新の記事を取ってくる
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash[:success] = "Article Update"
    redirect_to articles_path
  end

  private 
   def article_params
    params.require(:article).permit(:content, :title)
   end

   def correct_user_article
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
   end

   def logged_in_user 
    unless logged_in?
     flash[:danger] = "Please log in."
     redirect_to root_path
    end
  end
end
