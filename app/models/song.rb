class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  require_relative './concerns/slugifiable'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

end
