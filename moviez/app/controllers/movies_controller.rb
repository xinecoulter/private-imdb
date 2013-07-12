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
    new_movie = Imdb::Search.new(params[:title]).movies.first
    movie = Movie.new
    movie.title = new_movie.title
    movie.year = new_movie.year
    movie.plot = new_movie.plot
    movie.mpaa_rating = new_movie.mpaa_rating
    if params[:rating]
      movie.rating = params[:rating]
    end
    movie.poster = new_movie.poster
    new_movie.cast_members.each do |cast_member|
      if Actor.where(name: cast_member) == []
        actor = Actor.new(name: cast_member)
        actor.save
        movie.actors << actor
      else
        actor = Actor.where(name: cast_member)
        movie.actors << actor
      end
    end
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