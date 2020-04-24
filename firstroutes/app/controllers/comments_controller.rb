class CommentsController < ApplicationController

    def index
        if params[:artwork_id]
            art = Artwork.find(params[:artwork_id])
            @comments = art.comments

        elsif params[:user_id]
            user = User.find(params[:user_id])
            @comments = user.comments
        else
            @comments = Comment.all
        end

        if @comments.length == 0
             render json: 'No comments found'
        else
             render json: @comments
        end
    end
    
    def create
        @comment = Comment.new(comment_params)

        if @comment.save!
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :commenter_id, :artwork_id)
    end

end