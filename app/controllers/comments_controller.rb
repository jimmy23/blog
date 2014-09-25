class CommentsController < ApplicationController
	include ApplicationHelper

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params[:comment] = {}
		if @current_user
			params[:comment][:commenter] = @current_user.email.split("@")[0]
		end

		params[:comment][:body] = clean_html(params[:body])
		params.require(:comment).permit(:commenter, :body)
	end
end
