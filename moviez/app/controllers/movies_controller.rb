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

  def new_search
    @movies = Imdb::Search.new(params[:title]).movies[0..9]
    render "new"
  end

  def new
    if params[:title]
      @movies = Imdb::Search.new(params[:title]).movies[0..9]
    else
      @movies = nil
    end
  end
end