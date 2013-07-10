class MoviesController < ApplicationController
  def search
    @movies = Movie.where(title: params[:title])
    render "index"
  end

  def index
    if params[:task]
      @movies = Movie.where(title: params[:title])
    else
      @movies = Movie.all
    end
  end
end