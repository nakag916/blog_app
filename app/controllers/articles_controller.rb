class ArticlesController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    end
  end

  def show
    #データベースから最新の記事を取ってくる
    @article = Article.find(params[:id])
  end

  def destroy
    #binding.pry
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_to request.referrer || root_url
  end

  private 
   def article_params
    params.require(:article).permit(:content, :title)
   end

   def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
   end
end
