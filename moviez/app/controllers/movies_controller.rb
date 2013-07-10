class MoviesController < ApplicationController
  def search
    @movies = Movie.where(title: params[:title])
    render "index"
  end

  def index
    if params[:title]
      @movies = Movie.where(title: params[:title])
    else
      @movies = Movie.all
    end
  end

  def new
  end
end