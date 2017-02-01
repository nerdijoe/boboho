class ListingsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  before_action only: [:edit, :update] do
    auth_listings(params[:id])
  end
  before_action :auth_destroy, only: [:destroy]


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
    # auth_listings(@listing)
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      redirect_to user_listing_path(user_id: session[:user_id], id: @listing.id), notice: 'Your listing has been updated.'
    else
      flash[:alert] = 'Something is not right, your changes are not saved.'
      render 'edit'
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    listing.destroy
    # redirect_to user_listings_path(user_id: session[:user_id]), notice: "Your listing has been deleted."
    redirect_to root_path, notice: "Listing #{listing.name} has been deleted."
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :price, :currency, :description, :condition, :delivery, :subcategory_id, {photos: []})
  end


end
