class ArtworkSharesController < ApplicationController
 
  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find_by(id: params[:id])

    if @artwork_share
      render plain: @artwork_share.destroy
    else
      render plain: "artwork_share not found"
    end
  end

  private

  def artwork_share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end