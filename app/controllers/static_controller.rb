class StaticController < ApplicationController
  def index
    @categories = Category.all.includes(:listings)
    @search_new = Search.new
    
    @gadgets = Subcategory.find_by_name("Gadgets")
    @vr = Subcategory.find_by_name("Virtual Reality")
    @drones = Subcategory.find_by_name("Drones")
  end
end
