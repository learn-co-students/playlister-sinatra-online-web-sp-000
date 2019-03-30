require_relative './modules/slug'


class Genre < ActiveRecord::Base
  include Slug

  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  has_many :song_genres
end
