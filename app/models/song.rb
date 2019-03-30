require_relative './modules/slug'

class Song < ActiveRecord::Base
  include Slug

  belongs_to :artist
  has_many :genres, :through => :song_genres
  has_many :song_genres
end
