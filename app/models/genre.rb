require_relative 'slugable.rb'

class Genre < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMehthods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end