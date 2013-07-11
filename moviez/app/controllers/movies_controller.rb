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
    @movie = Imdb::Search.new(params[:title]).movies.first
    render "new"
  end

  def new
    if params[:title]
      @movie = Imdb::Search.new(params[:title]).movies.first
    else
      @movie = nil
    end
  end
end