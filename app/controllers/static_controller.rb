class StaticController < ApplicationController
  def index
    @categories = Category.all.includes(:listings)
    @search_new = Search.new
    @gadgets = Subcategory.find_by_name("Gadgets")
  end
end
