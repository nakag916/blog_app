class TopController < ApplicationController
 def index
  #最新のarticleにリダイレクトするような処理を書く
  a = Article.last
  redirect_to article_path(a)
 end
end
