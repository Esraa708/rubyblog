class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    def new
      @comment = Comment.new(params[:comment])
    end
    
    def edit
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:id])

    end
    def update
      @comment = Comment.find(params[:id])
      @article = Article.find(params[:article_id])
      if @comment.update(comment_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
     
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
