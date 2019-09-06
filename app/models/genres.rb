require_relative './concerns/slugifiable.rb'
class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Concerns::Slug
  extend Concerns::Find_by_slug
end
