class Song < ActiveRecord::Base
     belongs_to :artist
     has_many :song_genres
     has many :genres, through :song_genres
     
     end