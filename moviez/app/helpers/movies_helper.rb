module MoviesHelper
  def movie_length_hours(movie)
    # number of whole hours in movie length
    hours = movie.length / 60
  end

  def movie_length_minutes(movie)
    # number of minutes left over in movie length
    hours = movie.length % 60
  end
end