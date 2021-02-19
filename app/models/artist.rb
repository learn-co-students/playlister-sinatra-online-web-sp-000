require './app/models/concerns/slugifiable'
require './app/models/concerns/findable'

class Artist < ActiveRecord::Base  
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  extend Findable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end