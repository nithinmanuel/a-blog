class CommentsController < ApplicationController

   http_basic_authenticate_with name: "nithin", password: "nithin", only: :destroy

	def create
	   @article = Article.find(params[:article_id]) 
     puts "wer"
	   @comment = @article.comments.create(comment_params)
	   redirect_to article_path(@article)
    end

  def update
     @article = Article.find(params[:article_id])
     puts "wer"
     @comment = @article.comments.find(params[:id])
     puts "wer"
     if @comment.update(params)
  
     redirect_to article_path(@article)

   else
    render 'show'
  end
     #edit_article_comment_path(@comment)
     #redirect_to article_comment_path(@comment)
  end  

	def destroy
		@article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        puts "wer"
        @comment.destroy
        redirect_to article_path(@article) 
    end


       
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end    
   

