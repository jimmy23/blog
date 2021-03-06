class ArticlesController < ApplicationController
  include ApplicationHelper

  before_action :auth_log_in, :not_is_admin_redirect_to_404, only: [:new, :create, :destroy, :update]

  def index
  	@articles = Article.page(params[:page])

    @top10 = Article.order("id desc").limit(10)
  end

  def new
  	@article = Article.new
  end

  def show
  	@article = Article.find(params[:id])
  end

  def create
  	@article = Article.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render 'new'
  	end
  end

  def update

  end

  def find_page
    current_id, type = params[:current_id], params[:type]

    if type == "pre"
      @article = Article.where("id < ?", current_id).order("id desc").first
    else
      @article = Article.where("id > ?", current_id).first
    end

    if @article
      redirect_to @article
    else
      redirect_to articles_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:notice] = "文章已删除"
    redirect_to articles_path
  end

  private

  def article_params
    params[:article][:content] = clean_html(params[:content])
  	params.require(:article).permit(:title, :content)
  end

  def not_is_admin_redirect_to_404
    unless is_admin?
      render '/public/404.html'
    end
  end
end
