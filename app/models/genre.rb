require_relative './concerns/slugifiable.rb'
require_relative './concerns/findable.rb'

class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, :through => :song_genres
    has_many :artists, :through => :songs

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    extend Findable::ClassMethods

end