class CommentsController < ApplicationController
	include ApplicationHelper

	def create
		# return
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params[:comment] ||= {}
		commenter = @current_user ? @current_user.email.split("@")[0] : (params[:comment][:commenter].empty? ? "游客" : params[:comment][:commenter].split("@")[0])
		params[:comment][:commenter] = commenter

		params[:comment][:body] = clean_html(params[:body])
		params.require(:comment).permit(:commenter, :body)
	end
end
