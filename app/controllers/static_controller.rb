class StaticController < ApplicationController
  def index
    @categories = Category.all.includes(:listings)
  end
end
