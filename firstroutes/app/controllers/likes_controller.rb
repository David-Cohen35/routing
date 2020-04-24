class LikesController < ApplicationController

    def index
        if params[:comment_id]
            comment = Comment.find(params[:comment_id])
            @likes = comment.likes
        elsif params[:artwork_id]
            artwork = Artwork.find(params[:artwork_id])
            @likes = artwork.likes
        elsif params[:user_id]
            user = User.find(params[:user_id])
            @likes = user.likes
        else
            @likes = Like.all
        end

        render json: @likes
    end

    def create
        @like = Like.new(like_params)

        if @like.save!
            render json: @like
        else
            render json: @like.errors.full_messages, status: 422
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: @like
    end

    private 
    
    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end

end


