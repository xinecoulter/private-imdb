class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  attr_accessible :title, :year, :plot, :mpaa_rating, :rating, :poster
end