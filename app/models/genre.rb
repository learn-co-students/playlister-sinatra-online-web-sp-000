require_relative '../../lib/slug'

class Genre < ActiveRecord::Base 
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  
  include Slug::InstanceMethods
  extend Slug::ClassMethods
end 