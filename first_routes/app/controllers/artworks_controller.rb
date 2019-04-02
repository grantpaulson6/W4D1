class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    if params.has_key?(:user_id)
      shared_art = User.find(params[:user_id]).shared_artworks
      # shared_art = ArtworkShare.where(viewer_id: params[:user_id])
      created_art = Artwork.where(artist_id: params[:user_id])
      @artworks = shared_art + created_art
    end

    if @artworks
      render json: @artworks
    else
      render plain: "We should never see this"
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])

    if @artwork
      render json: @artwork
    else
      render plain: "No artwork found"
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])

    if @artwork
      @artwork.update(artwork_params)
      render json: @artwork
    else
      render plain: "Artwork not found"
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])

    if @artwork
      render plain: @artwork.destroy
    else
      render plain: "Artwork not found"
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id, :user_id)
  end
end
