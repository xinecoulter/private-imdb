class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies
  attr_accessible :name
end