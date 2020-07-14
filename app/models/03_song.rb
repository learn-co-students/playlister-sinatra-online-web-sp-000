class Song < ActiveRecord::Base
  extend Slugs::ClassMethod
  include Slugs::InstanceMethod
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
