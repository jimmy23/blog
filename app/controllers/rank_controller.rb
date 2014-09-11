class RankController < ApplicationController
  def new_top10
  	@articles = Article.order("id desc").limit(10)
  end
end
