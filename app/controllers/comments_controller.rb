class CommentsController < ApplicationController

    def new
        @user = current_user
        @post = Post.find(params[:post_id])
        @comment = @user.comments.new
    end 

    def create
        @user = current_user
        @post = Post.find(params[:post_id])
        @comment = @user.comments.build(comment_params)
        if @comment.save
            redirect_to @post.user
        else
            render :new
        end
    end


    def destroy
        
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @comment.post.user
    end





    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
