class SongGenre < ActiveRecord::Base 
  belongs_to :Song 
  belongs_to :Genre 
end 