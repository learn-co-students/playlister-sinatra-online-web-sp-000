class SongGenre < ActiveRecord::Base
  belongs_to :artist, :genre 
end