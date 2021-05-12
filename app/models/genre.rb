class Genre < ActiveRecord::Base
  include Gremlins::InstanceMethods
  extend Gremlins::ClassMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
