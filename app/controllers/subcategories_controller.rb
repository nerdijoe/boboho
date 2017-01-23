class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
  end
end
