
class Song < ActiveRecord::Base
  extend Slugifiable::ClassMethod
  include Slugifiable::InstanceMethod

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
 end
