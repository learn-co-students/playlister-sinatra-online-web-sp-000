class Song < ActiveRecord::Base
  #include Slugifiable::InstanceMethods
  include Slugifiable
  extend Slugifiable

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end