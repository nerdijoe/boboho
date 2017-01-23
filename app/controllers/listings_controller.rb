class ListingsController < ApplicationController
  def index
    @listings = Listing.where(user_id: session[:user_id])
    @categories = Category.all
  end

  def new
    @listing = Listing.new
    @categories = Category.all
    @subcategories = Subcategory.all

  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = session[:user_id]
    
    if @listing.save
      redirect_to root_path, notice: 'Your listing has been created.'
    else
      flash[:alert] = 'Something is not right, your listing is not created.'
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      redirect_to user_listings_path(user_id: session[:user_id]), notice: 'Your listing has been updated.'
    else
      flash[:alert] = 'Something is not right, your changes are not saved.'
      render 'edit'
    end
  end

  def destroy
    Listing.find(params[:id]).destroy
    redirect_to user_listings_path(user_id: session[:user_id]), notice: "Your listing has been deleted."
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :price, :currency, :description, :condition, :delivery, :subcategory_id, {photos: []})
  end
end
