class StaticController < ApplicationController
  def index
    @categories = Category.all.includes(:listings)
    @search_new = Search.new
  end
end
