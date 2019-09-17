# frozen_string_literal: true

# Searches controller
class SearchesController < ApplicationController
  def new
    @categories = Category.all
  end

  def create
    @search = Connector::ChuckNorris.query params[:q]
    redirect_to search_path(@search)
  end

  def show
    @search = Search.find params[:id]
  end
end
