class LikesController < ApplicationController

  def create

    @like = current_user.likes.find_by_listing_id(params[:listing_id])

    if @like.present?
      # if user has already liked this listing, then destroy his like
      @like.destroy

      respond_to do |format|
        # format.html { redirect_to :back }
        format.js
      end

    else

      @like = Like.new
      @like.user_id = current_user.id
      @like.listing_id = params[:listing_id]

      @like.save

      # this code below is for Non-Ajax
      # redirect_to :back, notice: "#{current_user.username} likes listing #{@like.listing.name}"

      respond_to do |format|
        # format.html { redirect_to :back }
        format.js
      end
    end

  end
end
