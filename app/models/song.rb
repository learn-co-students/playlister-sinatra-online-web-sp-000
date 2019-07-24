class Song < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :artists
  has_many :genres, through: :song_genres
  has_many :song_genres
end
