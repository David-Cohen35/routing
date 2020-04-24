class ArtworksharesController < ApplicationController


    def create
        @artwork_share = ArtworkShares.new(artwork_share_params)

        if @artwork_share.save!
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork_share = ArtworkShares.find(params[:id])
        @artwork_share.destroy
        render json: @artwork_share
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id, :favorited)
    end

end