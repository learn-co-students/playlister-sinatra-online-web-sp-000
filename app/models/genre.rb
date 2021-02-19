require './app/models/concerns/slugifiable'
require './app/models/concerns/findable'

class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  extend Findable::ClassMethods
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs  
end