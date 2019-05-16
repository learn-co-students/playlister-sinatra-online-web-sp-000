class Genre < ActiveRecord::Base 
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  attr_accessor :name
  
  
end