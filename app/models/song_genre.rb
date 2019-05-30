
class SongGenre < ActiveRecord::Base
  
  extend Slugifiable
  belongs_to :song
  belongs_to :genre
end 
