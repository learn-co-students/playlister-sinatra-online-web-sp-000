class Song < ActiveRecord::Base
  has_many :genres
  belong_to :artist
end
