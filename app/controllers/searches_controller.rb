class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])

    @listings = Listing.all.order(created_at: :asc)
    @listings = @listings.search_query(@search.keyword) if @search.keyword.present?

    @search_new = Search.new
  end

  private
  def search_params
    params.require(:search).permit(:keyword, :users, :items)

  end
end
