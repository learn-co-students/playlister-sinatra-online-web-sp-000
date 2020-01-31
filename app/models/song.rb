require_relative './concerns/slugifiable.rb'
require_relative './concerns/findable.rb'

class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, :through => :song_genres

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    extend Findable::ClassMethods
end