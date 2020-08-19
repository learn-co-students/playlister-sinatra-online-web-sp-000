class SongGenre < ActiveRecord::Base
     belongs_to :song
     belongs_to :genre
    #  has_many :genres
  end