class TopController < ApplicationController
 PER = 10

 def index
  @articles = Article.page(params[:page]).per(PER)
  #@articles = Article.all
 end
end
