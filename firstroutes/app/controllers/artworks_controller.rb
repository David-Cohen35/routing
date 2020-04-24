class ArtworksController < ApplicationController

    def index
        if params[:user_id]
            user = User.find(params[:user_id])
            @artworks = user.shared_artworks + user.artworks
        else
            @artworks = Artwork.all
        end

        render json: @artworks
    end

    def create
        # user = User.new(params.require(:user).permit(:name, :email))
        @artwork = Artwork.new(artwork_params)

        if @artwork.save!
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end


    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork.id) 
        else
            render json: @artwork.errors.full_messages, status: 422
        end

    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        #redirect_to users_url
        render json: @artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id, :favorited)
    end

end