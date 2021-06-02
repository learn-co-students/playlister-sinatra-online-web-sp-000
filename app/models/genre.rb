require_relative './concerns/slugfiable.rb' #add this so it can find module

class Genre < ActiveRecord::Base
  include Slugfiable::InstanceMethods
  extend Slugfiable::ClassMethods

  has_many :song_genres
  has_many :songs, through: :song_genres

  has_many :artists, through: :songs
end
