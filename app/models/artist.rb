
class Artist < ActiveRecord::Base
  
  extend Slugifiable
  has_many :songs 
  has_many :genres, through: :songs
end 