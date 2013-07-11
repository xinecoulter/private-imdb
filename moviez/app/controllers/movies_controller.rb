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

  def create
    favorite = Imdb::Search.new(params[:title]).movies.first
    movie = Movie.new
    movie.title = favorite.title
    movie.year = favorite.year
    movie.plot = favorite.plot
    movie.mpaa_rating = favorite.mpaa_rating
    movie.rating = 100
    movie.poster = favorite.poster
    movie.save
    redirect_to "/movies"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    case params[:rating]
    when "favorite"
      @movie.rating = 100
    when "up"
      @movie.rating += 1
    when "down"
      @movie.rating -= 1
    end
    @movie.save
    render "show"
  end
end