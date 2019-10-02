require './app/models/concerns/slugifiable'

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
  
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end